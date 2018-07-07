<template>
    <div>
        <head-top></head-top>
        <div class="table_container">
            <div class="search_style">
              <span  class="text_style">年级：
                <el-select v-model="value8" filterable placeholder="请选择">
                  <el-option
                    v-for="item in tableData.grade"
                    :key="tableData.grade"
                    :label="tableData.grade"
                    :value="tableData.grade">
                  </el-option>
                </el-select>
              </span>
              <span  class="text_style">学院：
                <el-select v-model="value11" filterable placeholder="请选择">
                  <el-option
                    v-for="item in academes"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
              </span>              
              <span  class="text_style">专业：
                <el-select v-model="value13" filterable placeholder="请选择">
                  <el-option
                    v-for="item in programs"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
              </span>    
              <el-button type="primary">查询</el-button>          
            </div>
            <el-table
                :data="tableData"
                style="width: 100%">
                <el-table-column type="expand">
                  <template scope="props">
                    <el-form label-position="left" inline class="demo-table-expand">
                      <el-form-item label="姓名">
                        <span>{{ props.row.name }}</span>
                      </el-form-item>
                      <el-form-item label="学院">
                        <span>{{ props.row.college }}</span>
                      </el-form-item>
                      <el-form-item label="学号">
                        <span>{{ props.row.stuNum }}</span>
                      </el-form-item>
                      <el-form-item label="专业班级">
                        <span>{{ props.row.classId }}</span>
                      </el-form-item>
                      <el-form-item label="年级">
                        <span>{{ props.row.grade }}</span>
                      </el-form-item>
                      <el-form-item label="密码">
                        <span>{{ props.row.password }}</span>
                      </el-form-item>                      
                    </el-form>
                  </template>
                </el-table-column>
                <el-table-column
                  label="学号"
                  prop="stuNum">
                </el-table-column>
                <el-table-column
                  label="姓名"
                  prop="name">
                </el-table-column>
                <el-table-column
                  label="学院"
                  prop="collegeId">
                </el-table-column>
                <el-table-column
                  label="专业班级"
                  prop="classId">
                </el-table-column>  
                <el-table-column
                  label="年级"
                  prop="grade">
                </el-table-column>              
                <el-table-column label="操作" width="200">
                  <template scope="scope">
                    <el-button
                      size="mini"
                      @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                    <!-- <el-button
                      size="mini"
                      type="Success"
                      @click="addFood(scope.$index, scope.row)">添加食品</el-button> -->
                    <el-button
                      size="mini"
                      type="danger"
                      @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                  </template>
                </el-table-column>
            </el-table>
            <div class="Pagination">
                <el-pagination
                  @size-change="handleSizeChange"
                  @current-change="handleCurrentChange"
                  :current-page="currentPage"
                  :page-size="20"
                  layout="total, prev, pager, next"
                  :total="count">
                </el-pagination>
            </div>
            <el-dialog title="修改信息" v-model="dialogFormVisible">
                <el-form :model="selectTable">
                    <el-form-item label="姓名" label-width="100px">
                        <el-input v-model="selectTable.name" auto-complete="off" :disabled="true"></el-input>
                    </el-form-item>
                    <el-form-item label="学号" label-width="100px">
                        <el-input v-model="selectTable.stuNum" :disabled="true"></el-input>
                    </el-form-item>                    
                    <el-form-item label="学院" label-width="100px">
                    <!-- 学院这里应该是下拉框式的 -->
                        <!-- <el-autocomplete
                          v-model="address.address"
                          :fetch-suggestions="querySearchAsync"  
                          style="width: 100%;"
                          @select="addressSelect"
                        ></el-autocomplete> -->
                        <el-cascader
                          :options="selectTable"
                          v-model="selectedCategory"
                          change-on-select
                        ></el-cascader>                        
                    </el-form-item>
                    <el-form-item label="专业班级" label-width="100px">
                        <el-cascader
                          :options="selectTable"
                          v-model="selectedCategory"
                          change-on-select
                        ></el-cascader>                     
                    </el-form-item>                      
                    <el-form-item label="年级" label-width="100px">
                        <el-cascader
                          :options="selectTable"
                          v-model="selectedCategory"
                          change-on-select
                        ></el-cascader>                           
                    </el-form-item>
                    <el-form-item label="密码" label-width="100px">
                        <el-input v-model="selectTable.password"></el-input>
                    </el-form-item>
                </el-form>
              <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="updateShop">确 定</el-button>
              </div>
            </el-dialog>
        </div>
    </div>
</template>

<script>
    import headTop from '../components/headTop'
    import {baseUrl, baseImgPath} from '@/config/env'
    import {getStuList, getStuCount} from '@/api/getData'
    // import {cityGuess, getResturants, getResturantsCount, foodCategory, updateResturant, searchplace, deleteResturant, getUserCity} from '@/api/getData'
    export default {
    	data(){
    		return {
    			baseUrl,
                baseImgPath,
                city: {},
                offset: 0,
                limit: 20,
                count: 0,
                tableData: null,
                currentPage: 1,
                selectTable: {},
                dialogFormVisible: false,
                categoryOptions: [],
                selectedCategory: [],
                address: {},
                options: [{
                  value: '选项1',
                  label: '2014'
                }, {
                  value: '选项2',
                  label: '2015'
                }, {
                  value: '选项3',
                  label: '2016'
                }, {
                  value: '选项4',
                  label: '2017'
                }, {
                  value: '选项5',
                  label: '2018'
                }],
                value8: '',
                academes: [{
                  value: '选项1',
                  label: '计算机学院'
                }, {
                  value: '选项2',
                  label: '管理学院'
                }, {
                  value: '选项3',
                  label: '自动化学院'
                }, {
                  value: '选项4',
                  label: '机械学院'
                }, {
                  value: '选项5',
                  label: '汽交学院'
                }],
                value11: '',
                value13: '',
                multipleSelection: [],
    		}
    	},
    	created(){
            this.initData();
        },
        components: {
            headTop,
        },
        methods: {
            // async initData(){
            //     try{
            //         this.city = await cityGuess();
            //         const countData = await getResturantsCount();
            //         if (countData.status == 1) {
            //             this.count = countData.count;
            //         }else{
            //             throw new Error('获取数据失败');
            //         }
            //         this.getResturants();
            //     }catch(err){
            //         console.log('获取数据失败', err);
            //     }
            // },
              
            async initData(){
                try{
                    const countData = await getStuCount();
                    if (countData.status == 0) {
                        this.count = countData.data.count;
                    }else{
                        throw new Error('获取数据失败');
                    }
                    this.getUsers();
                }catch(err){
                    console.log('获取数据失败', err);
                }
            },
            async getUsers(){
                const result = await getStuList({offset: this.offset, limit: this.limit});
                this.tableData = [];
                const Users = result.data;
                Users.forEach(item => {
                    const tableData = {};
                    tableData.name = item.name;
                    tableData.classId = item.classId;
                    tableData.grade = item.grade;
                    tableData.stuNum = item.stuNum;
                    tableData.collegeId = item.collegeId;
                    tableData.college = item.college;
                    tableData.password = item.password;
                    this.tableData.push(tableData);
                })
            },  
            // async getCategory(){
            //     try{
            //         const categories = await foodCategory();
            //         categories.forEach(item => {
            //             if (item.sub_categories.length) {
            //                 const addnew = {
            //                     value: item.name,
            //                     label: item.name,
            //                     children: []
            //                 }
            //                 item.sub_categories.forEach((subitem, index) => {
            //                     if (index == 0) {
            //                         return
            //                     }
            //                     addnew.children.push({
            //                         value: subitem.name,
            //                         label: subitem.name,
            //                     })
            //                 })
            //                 this.categoryOptions.push(addnew)
            //             }
            //         })
            //     }catch(err){
            //         console.log('获取商铺种类失败', err);
            //     }
            // },
            // async getResturants(){
            //     const {latitude, longitude} = this.city;
            //     const restaurants = await getResturants({latitude, longitude, offset: this.offset, limit: this.limit});
            //     this.tableData = [];
            //     restaurants.forEach(item => {
            //         const tableData = {};
            //         tableData.name = item.name;
            //         tableData.address = item.address;
            //         tableData.description = item.description;
            //         tableData.id = item.id;
            //         tableData.phone = item.phone;
            //         tableData.rating = item.rating;
            //         tableData.recent_order_num = item.recent_order_num;
            //         tableData.category = item.category;
            //         tableData.image_path = item.image_path;
            //         this.tableData.push(tableData);
            //     })
            // },
            handleSizeChange(val) {
                console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val) {
                this.currentPage = val;
                this.offset = (val - 1)*this.limit;
                this.getResturants()
            },
            handleEdit(index, row) {
                this.selectTable = row;
                this.address.address = row.address;
                this.dialogFormVisible = true;
                this.selectedCategory = row.category.split('/');
                if (!this.categoryOptions.length) {
                    this.getCategory();
                }
            },
            // addFood(index, row){
            //     this.$router.push({ path: 'addGoods', query: { restaurant_id: row.id }})
            // },
            // async handleDelete(index, row) {
            //     try{
            //         const res = await deleteResturant(row.id);
            //         if (res.status == 1) {
            //             this.$message({
            //                 type: 'success',
            //                 message: '删除店铺成功'
            //             });
            //             this.tableData.splice(index, 1);
            //         }else{
            //             throw new Error(res.message)
            //         }
            //     }catch(err){
            //         this.$message({
            //             type: 'error',
            //             message: err.message
            //         });
            //         console.log('删除店铺失败')
            //     }
            // },
            // async querySearchAsync(queryString, cb) {
            //     if (queryString) {
            //         try{
            //             const cityList = await searchplace(this.city.id, queryString);
            //             if (cityList instanceof Array) {
            //                 cityList.map(item => {
            //                     item.value = item.address;
            //                     return item;
            //                 })
            //                 cb(cityList)
            //             }
            //         }catch(err){
            //             console.log(err)
            //         }
            //     }
            // },
            // addressSelect(vale){
            //     const {address, latitude, longitude} = vale;
            //     this.address = {address, latitude, longitude};
            // },
            // handleServiceAvatarScucess(res, file) {
            //     if (res.status == 1) {
            //         this.selectTable.image_path = res.image_path;
            //     }else{
            //         this.$message.error('上传图片失败！');
            //     }
            // },
            // beforeAvatarUpload(file) {
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
            // async updateShop(){
            //     this.dialogFormVisible = false;
            //     try{
            //         Object.assign(this.selectTable, this.address);
            //         this.selectTable.category = this.selectedCategory.join('/');
            //         const res = await updateResturant(this.selectTable)
            //         if (res.status == 1) {
            //             this.$message({
            //                 type: 'success',
            //                 message: '更新店铺信息成功'
            //             });
            //             this.getResturants();
            //         }else{
            //             this.$message({
            //                 type: 'error',
            //                 message: res.message
            //             });
            //         }
            //     }catch(err){
            //         console.log('更新餐馆信息失败', err);
            //     }
            // },
        }
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
        width: 50%;
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
    .search_style{
        margin-bottom: 20px;
    }
    .text_style{
        padding: 10px;
        color: #aaa;
    }    
	
</style>
