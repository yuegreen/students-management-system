<template>
    <div class="fillcontain">
        <head-top></head-top>
        <div class="table_container">
            <el-table
                :data="tableData"
                border
                style="width: 100%">

                <el-table-column
                  label="姓名"
                  prop="name">
                </el-table-column>
                <el-table-column
                  label="项目类别"
                  prop="rule">
                </el-table-column>
                <el-table-column
                  label="项目名称"
                  prop="projectName">
                </el-table-column>
                <el-table-column
                  label="拟申学分"
                  prop="createScore">
                </el-table-column>
                 <el-table-column
                  label="状态"
                  prop="status">
                </el-table-column>
                <el-table-column
                  label="审核意见"
                  prop="failReason">
                </el-table-column>
                <el-table-column
                  label="操作"
                  prop="operation">
                    <template scope="scope">
                        <el-button
                          size="small"
                          type="danger"
                          @click="deleteSpecs(scope.$index)">删除</el-button>
                        <el-button
                      size="small"
                      @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                    </template>
                </el-table-column>
            </el-table>
            <div class="Pagination">
                <el-pagination
                  :current-page="currentPage"
                  :page-size="20"
                  layout="total, prev, pager, next"
                  :total="count">
                </el-pagination>
            </div>
            <el-dialog title="修改信息" v-model="dialogFormVisible">
                <el-form :model="selectTable" ref="selectTable" style="width:70%;margin-left: 10%">
                    <el-form-item label="姓名" label-width="100px" prop="username" >
                        <el-input v-model="selectTable.name" :disabled = "true"></el-input>
                    </el-form-item>
                    <el-form-item label="项目类别" label-width="100px">
                          <el-cascader
                            :props="props" v-model="selectTable.catalog"
                            style="width:100%;"
                            placeholder="搜索"
                            :options="options"
                            filterable
                            change-on-select
                          ></el-cascader>
                    </el-form-item>
                    <el-form-item label="项目名称" label-width="100px">
                        <el-input v-model="selectTable.projectName"></el-input>
                    </el-form-item>
                    <el-form-item label="完成时间" label-width="100px">
                    <el-date-picker
                        v-model="selectTable.finishTime"
                        type="date"
                        placeholder="选择日期"
                        @change="dateChange"
                        value-format="yyyy-MM-dd">
                    </el-date-picker>
                    </el-form-item>
                    <el-form-item label="具体内容" label-width="100px">
                    <el-input v-model="selectTable.content" type="textarea"
                        :autosize="{ minRows: 4, maxRows: 10}"></el-input>
                    </el-form-item>
                        <el-form-item label="拟申学分" label-width="100px">
                        <el-input v-model="selectTable.createScore"></el-input>
                    </el-form-item>
                    <el-form-item label="材料证明" label-width="100px">
                        <el-upload
                            ref="upload"
                            class="upload-demo"
                            action="//localhost:8080/ScoreManagement/ZiLiao/upload"
                            :http-request="myUpload"
                            :on-preview="handlePreview"
                            :on-remove="handleRemove"
                            :on-success="handleSuccess"
                            :on-error="handleError"
                            :file-list="fileList2"
                            multiple
                            list-type="picture">
                        <el-button size="small" type="primary">点击上传</el-button>
                        <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                        </el-upload>
                        </el-form-item>
                    <el-form-item label="状态" label-width="100px">
                        <el-input v-model="selectTable.status" :disabled = "true"></el-input>
                    </el-form-item>
                </el-form>
              <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="submitForm('selectTable')">确 定</el-button>
              </div>
            </el-dialog>

        </div>
    </div>
</template>

<script>
    import headTop from '../components/headTop'
    import {mapActions, mapState} from 'vuex'
    import {baseUrl, baseImgPath} from '@/config/env'
    import {getAdminInfo, getZiLiaoListByStudent, getStuCount, getStuList,getJudgeRuleById,updateZiLiao,deleteZiLiao, addZiLiao} from '@/api/getData'
    export default {
        data(){
            return {
                offset: 0,
                limit: 20,
                count: 0,imageUrl:'',
                uploadFiles:[],
                fileList2: [],
                status:0,
                currentPage: 1,
                selectTable: {},
                uploadFiles:[],
                dialogFormVisible: false,
                categoryOptions: [],
                selectedCategory: [],
                tableData: [],
                props:{
                    value: 'j_id',
                    label:'rule',
                    children: 'children'
                },
                options: []
            }
        },
        created(){
            this.getZiLiao();
            this.initData();
        },
        computed: {
            ...mapState(['adminInfo']),
        },
    	components: {
    		headTop,
    	},
        methods: {
            dateChange(date)
            {
                this.date = date;
                console.log(date);
            },
            async submitForm (formName) {
                //包含上传的文件信息和服务端返回的所有信息都在这个对象里
                this.uploadFiles = [];
                this.$refs.upload.uploadFiles.forEach(item => {
                console.log("item",item);
                let uploadFile = "";
                if(item.response)
                {
                    let response = item.response;
                    if(response.data.indexOf("localhost")>0)
                    {
                        uploadFile = "{\"name\":\""+item.name+"\",\"url\":\""+response.data+"\"}";
                    }else
                    {
                        uploadFile = "{\"name\":\""+item.name+"\",\"url\":\"http://localhost:8080/ScoreManagement/upload/"+response.data+"\"}";
                    }


                }else if(item.name)
                {
                    if(item.url.indexOf("localhost")>0)
                    {
                        uploadFile = "{\"name\":\""+item.name+"\",\"url\":\""+item.url+"\"}";
                    }else
                    {
                        uploadFile = "{\"name\":\""+item.name+"\",\"url\":\"http://localhost:8080/ScoreManagement/upload/"+item.url+"\"}";
                    }
                }
                this.uploadFiles.push(uploadFile);
                console.log("["+this.uploadFiles+"]");
                });
                const postData = {
                    id:this.selectTable.id,
                    catalogId:this.selectTable.catalog[this.selectTable.catalog.length-1],
                    stuId:this.adminInfo.stuId,
                    isCheck:"0",
                    createScore:this.selectTable.createScore,
                    content:this.selectTable.content,
                    files:"["+this.uploadFiles+"]",
                    failReason:"",
                    finishTime:this.date,
                    projectName:this.selectTable.projectName
                };
                const result = await updateZiLiao(postData);
                if(result.status == 0)
                {
                    this.$message({
                    type: 'success',
                    message: '修改成功'
                });
                    this.getZiLiao();
                    this.initData();
                    this.dialogFormVisible = false;
                }else
                {
                this.$message({
                type: 'error',
                message: res.message
                });
                }

            },
            async initData(){
                try{
                    const result = await getJudgeRuleById({id:1});
                    if (result.status == 0) {
                        this.options = result.data;
                    }else{
                        throw new Error('获取数据失败');
                    }
                }catch(err){
                    console.log('获取数据失败', err);
                }
            },
            async getZiLiao(){
                const result = await getAdminInfo({offset: this.offset, limit: this.limit});
                const result2 = await getZiLiaoListByStudent({stuNum:result.data.stuNum,page: 1, pageSize: 10});
                this.tableData = [];
                const Users = result.data;
                const Users2 = result2.data;
                Users2.forEach(item => {
                    const tableData = {};
                    tableData.name = item.name;
                    tableData.id = item.id;
                    tableData.rule = item.rule;
                    tableData.createScore = item.createScore;
                    tableData.content = item.content;
                    tableData.projectName = item.projectName;
                    tableData.catalogId = item.catalogId;
                    console.log(item.path);
                    tableData.path = JSON.parse(item.path);
                    console.log(tableData.path);
                    if(item.isCheck == 0 )
                    {
                        tableData.failReason = '';
                    }else{
                        tableData.failReason = item.failReason;
                    }
                    if(item.isCheck == 0 )
                    {
                        tableData.status ="未审核";
                    }else if(item.isCheck == 1){
                        tableData.status ="审核通过";
                    }else if(item.isCheck == 2){
                        tableData.status ="审核不通过";
                        }
                    this.tableData.push(tableData);
                })
            },

		    addspecs(){
				this.specs.push({...this.specsForm});
				this.specsForm.specs = '';
				this.specsForm.packing_fee = 0;
				this.specsForm.price = 20;
				this.specsFormVisible = false;
			},
            async delete(index)
            {
                const result = await deleteZiLiao({id:this.tableData[index].id});
                this.status = result.status;
            },
            async deleteSpecs(index){
                this.$confirm('此操作将永久删除该项目, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        this.delete(index);
                        if(this.status == 0)
                        {
                            this.$message({
                                type: 'success',
                                message: '删除成功!'
                            });
                            this.getZiLiao();
                        }else
                        {
                             this.$message({
                                type: 'error',
                                message: '删除失败!'
                             });
                        }
                    }).catch(() => {
                        this.$message({
                            type: 'info',
                            message: '已取消删除'
                    });
                });
			},
            handleSizeChange(val) {
                console.log(`每页 ${val} 条`);
            },
            handleEdit(row) {
                this.fileList2 = [];
                this.selectTable = this.tableData[row];
                this.fileList2 = this.selectTable.path;
                console.log(this.fileList2);
                this.dialogFormVisible = true;
            },
            handleSelect(index){
            	this.selectIndex = index;
            	this.selectMenu = this.menuOptions[index];
            },
            handleRemove(file, fileList) {
            console.log(file, fileList);
            },
            handlePreview(file) {
            console.log(file);
            },
            handleSuccess(response, file, fileList) {
            console.log(file);
            },
            handleError(err, file, fileList) {
            console.log(file);
            },

            handleServiceAvatarScucess(res, file) {
                if (res.status == 1) {
                    this.selectTable.image_path = res.image_path;
                }else{
                    this.$message.error('上传图片失败！');
                }
            },
            beforeAvatarUpload(file) {
                const isRightType = (file.type === 'image/jpeg') || (file.type === 'image/png');
                const isLt2M = file.size / 1024 / 1024 < 2;

                if (!isRightType) {
                    this.$message.error('上传头像图片只能是 JPG 格式!');
                }
                if (!isLt2M) {
                    this.$message.error('上传头像图片大小不能超过 2MB!');
                }
                return isRightType && isLt2M;
            },
            myUpload(content) {
                console.log('myUpload...');
                let formData=new FormData();
                formData.append('file',content.file);
            this.$http.post(content.action,formData).then(res => {
                content.onSuccess(res.data)
            }).catch(error => {
            if (error.response) {
            // The request was made and the server responded with a status code
            // that falls out of the range of 2xx
            content.onError('配时文件上传失败(' + error.response.status + ')，' + error.response.data);
            } else if (error.request) {
            // The request was made but no response was received
            // `error.request` is an instance of XMLHttpRequest in the browser and an instance of
            // http.ClientRequest in node.js
            content.onError('配时文件上传失败，服务器端无响应');
            } else {
            // Something happened in setting up the request that triggered an Error
            content.onError('配时文件上传失败，请求封装失败');
            }
            });
            }
        },
    }
</script>

<style lang="less">
	@import '../style/mixin';
    .demo-table-expand {
        font-size: 0;
    }
    .demo-table-expand label {
        width: 90px;
        color: #99a9bf;
    }
    .demo-table-expand .el-form-item {
        margin-right: 0;
        margin-bottom: 0;
    }
    .table_container{
        padding: 20px;
    }
    .Pagination{
        display: flex;
        justify-content: flex-start;
        margin-top: 8px;
    }
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
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
</style>
