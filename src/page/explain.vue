<template>
    <div class="fillcontain">
        <head-top></head-top>
        <header class="admin_title">修改密码</header>
        <div class="admin_set">
            <el-form :model="stuForm" :rules="rules" ref="stuForm">
                <el-form-item prop="username">
                    <el-input v-model="adminInfo.stuNum" placeholder="用户名" :disabled="true">
                    </el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input v-model="stuForm.password" placeholder="原密码"
                    type="password"></el-input>
                </el-form-item>
                <el-form-item prop="newpass">
                     <el-input v-model="stuForm.newpass" placeholder="请输入新密码"
                     type="password"></el-input>
                </el-form-item>
            </el-form>
             <el-button class="input_btn" type="primary" @click="submitForm('stuForm')">保 存</el-button>
        </div>

    </div>
</template>

<script>
    import headTop from '../components/headTop'
    import {mapActions, mapState} from 'vuex'
    import {baseUrl, baseImgPath, getAdminInfo, updateStudent} from '@/api/getData'

    export default {
        data(){
            return {
                baseUrl,
                baseImgPath,
                stuForm: {
                    username: '',
                    password: '',
                    newpass: ''
                },
                rules: {
                    username: [
                    { required: false, message: '请输入用户名', trigger: 'blur' },
                    ],
                    password: [
                    { required: true, message: '请输入原密码', trigger: 'blur' },
                    ],
                    newpass: [
                    { required: true, message: '请输入新密码', trigger: 'blur' },
                    ],
                },
                input: '',
            }
        },
        components: {
            headTop,
        },
        computed: {
            ...mapState(['adminInfo']),
        },
        methods: {
            // uploadImg(res, file) {
            //     if (res.status == 1) {
            //         this.adminInfo.avatar = res.image_path;
            //     }else{
            //         this.$message.error('上传图片失败！');
            //     }
            // },
            // beforeImgUpload(file) {
            //     const isRightType = (file.type === 'image/jpeg') || (file.type === 'image/png');
            //     const isLt2M = file.size / 1024 / 1024 < 2;

            //     if (!isRightType) {
            //         this.$message.error('上传头像图片只能是 JPG 格式!');
            //     }
            //     if (!isLt2M) {
            //         this.$message.error('上传头像图片大小不能超过 2MB!');
            //     }
            //     return isRightType && isLt2M;
            // },
            ...mapActions(['getAdminData']),
            async submitForm(formName) {
                this.$refs[formName].validate(async (valid) => {
                    if (valid) {
                        const res = await updateStudent({
                            stuNum:this.adminInfo.stuNum,
                            password:this.stuForm.password,
                            passwordNew:this.stuForm.newpass
                        })
                        if (res.status == 0) {
                            this.$message({
                                type: 'success',
                                message: '修改成功'
                            });
                            this.$router.push('explain')
                        }else{
                            this.$message({
                                type: 'error',
                                message: res.message
                            });
                        }
                    } else {
                        this.$notify.error({
                            title: '错误',
                            message: '修改失败',
                            offset: 100
                        });
                        return false;
                    }
                });
            },
// submitForm(stuForm) {
//                 const res = await updateStudent({
//                     stuNum: this.stuForm.username,
//                     password: this.stuForm.password,
//                     newpass: this.stuForm.newpass
//                 })
//                 if (res.status == 0) {

//                 }
//             }

        }
    }
</script>

<style lang="less">
    @import '../style/mixin';
    .explain_text{
        margin-top: 20px;
        text-align: center;
        font-size: 20px;
        color: #333;
    }
    .admin_set{
        width: 60%;
        background-color: #F9FAFC;
        min-height: 400px;
        margin: 10px auto 0;
        border-radius: 10px;
        .input_btn{
            width: 150px;
            margin: 10px auto;
            display: block;
        }
        ul > li{
            padding: 15px;
            label{
                display: inline-block;
                width: 80px;
                color: #666;
            }
            span{
                color: #666;
            }
        }
    }
    .admin_title{
        margin-top: 20px;
        .sc(24px, #666);
        text-align: center;
    }
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        margin-top: 10px;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .avatar-uploader .el-upload:hover {
        border-color: #20a0ff;
    }
    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 120px;
        height: 120px;
        line-height: 120px;
        text-align: center;
    }
    .avatar {
        width: 120px;
        height: 120px;
        display: block;
    }
    .input_style {
        display: inline-block;
        width: 300px;
    }
</style>

