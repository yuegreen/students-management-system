<template>
    <div class="fillcontain">
        <head-top></head-top>
        <div class="table_container">
            <el-form ref="form" :model="form" label-width="80px">
              <el-form-item label="姓名" prop="username">  <!-- 从数据库直接拿用户名和学号、专业班级等等 -->
                <el-input v-model="adminInfo.name" :disabled="true"></el-input>
              </el-form-item>
              <el-form-item label="学号">
                <el-input v-model="adminInfo.stuNum" :disabled="true"></el-input>
              </el-form-item>
              <el-form-item label="专业班级">
                <el-input v-model="adminInfo.className" :disabled="true"></el-input>
              </el-form-item>
              <el-form-item label="项目名称">
                <el-input v-model="form.project"></el-input>
              </el-form-item>
                <el-form-item label="完成时间">
                    <el-date-picker
                        v-model="form.time"
                        type="date"
                        placeholder="选择日期"
                        @change="dateChange"
                        value-format="yyyy-MM-dd">
                    </el-date-picker>
                </el-form-item>
              <el-form-item label="项目类别">
                <div class="block">
                  <el-cascader
                    v-model="form.catalog"
                    style="width:100%"
                    :props="props"
                    placeholder="搜索"
                    :options="options"
                    filterable
                    change-on-select
                  ></el-cascader>
                </div>
              </el-form-item>
              <el-form-item label="具体内容">
                <el-input v-model="form.text" type="textarea"
                :autosize="{ minRows: 4, maxRows: 10}"></el-input>
              </el-form-item>
              <el-form-item label="拟申学分">
                <el-input v-model="form.score"></el-input>
              </el-form-item>
              <el-form-item label="材料证明">
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
              <el-form-item>
                <el-button type="primary" @click="submitForm('form')">提交</el-button>
              </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script>
    import headTop from '../components/headTop'
    import {mapActions, mapState} from 'vuex'
    import {getAdminInfo,getJudgeRuleById,addZiLiao} from '@/api/getData'
    export default {
        data(){
            return {
               props:{
                    value: 'j_id',
                    label:'rule',
                    children: 'children'
                },
                date:"1997-9-9",
              imageUrl:'',
              uploadFiles:[],
              options: [],
              fileList2: [],
                form: {
                  name: '',
                  stuNum: '',
                  class: '',
                  program: '',
                  text: '',
                  score: '',
                  cailiao: ''
                }
            }
        },
    	components: {
    		headTop,
    	},
        created(){
          this.initData();
        },
        mounted(){

        },
        computed: {
            ...mapState(['adminInfo']),
        },
        methods: {
          ...mapActions(['getAdminData']),
                dateChange(date)
                {
                    this.date = date;
                    console.log(date);
                },
                async  submitForm (formName) {
                //包含上传的文件信息和服务端返回的所有信息都在这个对象里
                this.$refs.upload.uploadFiles.forEach(item => {
                    let response = item.response;
                    let uploadFile = "{\"name\":\""+item.name+"\",\"url\":\"http://localhost:8080/ScoreManagement/upload/"+response.data+"\"}";
                    this.uploadFiles.push(uploadFile);
                    console.log("["+this.uploadFiles+"]");
                });
                const postData = {
                    catalogId:this.form.catalog[this.form.catalog.length-1],
                    stuId:this.adminInfo.stuId,
                    isCheck:"0",
                    createScore:this.form.score,
                    content:this.form.text,
                    files:"["+this.uploadFiles+"]",
                    failReason:"",
                    finishTime:this.date,
                    projectName:this.form.project
                };
                const result = await addZiLiao(postData);
                if(result.status == 0)
                {
                    this.$message({
                        type: 'success',
                         message: '上传成功'
                     });
                    this.$router.push('foodList');
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
                    this.getOrders();
                }catch(err){
                    console.log('获取数据失败', err);
                }
            },
            onSubmit() {
                console.log('submit!');
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
        }
    }
</script>

<style lang="less">
	@import '../style/mixin';
    .table_container{
        padding: 20px;
        margin-left: 20%;
        width:50%;
    }
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
	    width: 50%;
	}
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
