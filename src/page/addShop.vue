<template>
    <div>
        <head-top></head-top>
        <div class="table_container">
            <div class="search_style">
              <!-- <span  class="text_style">年级：
                <el-select v-model="value8" filterable placeholder="请选择">
                  <el-option
                    v-for="item in tableData.grade"
                    :key="tableData.grade"
                    :label="tableData.grade"
                    :value="tableData.grade">
                  </el-option>
                </el-select>
              </span> -->
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
              <!-- <span  class="text_style">专业：
                <el-select v-model="value13" filterable placeholder="请选择">
                  <el-option
                    v-for="item in programs"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
              </span>     -->
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
                      <el-form-item label="工号">
                        <span>{{ props.row.account }}</span>
                      </el-form-item>
                      <el-form-item label="密码">
                        <span>{{ props.row.password }}</span>
                      </el-form-item>
                    </el-form>
                  </template>
                </el-table-column>
                <el-table-column
                  label="工号"
                  prop="account">
                </el-table-column>
                <el-table-column
                  label="姓名"
                  prop="name">
                </el-table-column>
                <el-table-column
                  label="学院"
                  prop="college">
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
                    <el-form-item label="工号" label-width="100px">
                        <el-input v-model="selectTable.account" :disabled="true"></el-input>
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
    import {getTeaList, getTeaCount} from '@/api/getData'
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
            async initData(){
                try{
                    const countData = await getTeaCount();
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
                const result = await getTeaList({offset: this.offset, limit: this.limit});
                this.tableData = [];
                const Users = result.data;
                //这里应该还有一个属性，负责管理的班级
                Users.forEach(item => {
                    const tableData = {};
                    tableData.name = item.name;
                    tableData.account = item.account;
                    tableData.collegeId = item.collegeId;
                    tableData.college = item.college;
                    tableData.password = item.password;
                    this.tableData.push(tableData);
                })
            },

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
            addFood(index, row){
                this.$router.push({ path: 'addGoods', query: { restaurant_id: row.id }})
            },
            async handleDelete(index, row) {
                try{
                    const res = await deleteResturant(row.id);
                    if (res.status == 1) {
                        this.$message({
                            type: 'success',
                            message: '删除店铺成功'
                        });
                        this.tableData.splice(index, 1);
                    }else{
                        throw new Error(res.message)
                    }
                }catch(err){
                    this.$message({
                        type: 'error',
                        message: err.message
                    });
                    console.log('删除店铺失败')
                }
            },
            async querySearchAsync(queryString, cb) {
                if (queryString) {
                    try{
                        const cityList = await searchplace(this.city.id, queryString);
                        if (cityList instanceof Array) {
                            cityList.map(item => {
                                item.value = item.address;
                                return item;
                            })
                            cb(cityList)
                        }
                    }catch(err){
                        console.log(err)
                    }
                }
            },
            addressSelect(vale){
                const {address, latitude, longitude} = vale;
                this.address = {address, latitude, longitude};
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
            async updateShop(){
                this.dialogFormVisible = false;
                try{
                    Object.assign(this.selectTable, this.address);
                    this.selectTable.category = this.selectedCategory.join('/');
                    const res = await updateResturant(this.selectTable)
                    if (res.status == 1) {
                        this.$message({
                            type: 'success',
                            message: '更新店铺信息成功'
                        });
                        this.getResturants();
                    }else{
                        this.$message({
                            type: 'error',
                            message: res.message
                        });
                    }
                }catch(err){
                    console.log('更新餐馆信息失败', err);
                }
            },
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



<!-- <template>
    <div>
        <head-top></head-top>
        <el-row style="margin-top: 20px;">
  			<el-col :span="12" :offset="4">
		        <el-form :model="formData" :rules="rules" ref="formData" label-width="110px" class="demo-formData">
					<el-form-item label="店铺名称" prop="name">
						<el-input v-model="formData.name"></el-input>
					</el-form-item>
					<el-form-item label="详细地址" prop="address">
						<el-autocomplete
						  v-model="formData.address"
						  :fetch-suggestions="querySearchAsync"
						  placeholder="请输入地址"
						  style="width: 100%;"
						  @select="addressSelect"
						></el-autocomplete>
						<span>当前城市：{{city.name}}</span>
					</el-form-item>
					<el-form-item label="联系电话" prop="phone">
						<el-input v-model.number="formData.phone" maxLength="11"></el-input>
					</el-form-item>
					<el-form-item label="店铺简介" prop="description">
						<el-input v-model="formData.description"></el-input>
					</el-form-item>
					<el-form-item label="店铺标语" prop="promotion_info">
						<el-input v-model="formData.promotion_info"></el-input>
					</el-form-item>
					<el-form-item label="店铺分类">
						<el-cascader
						  :options="categoryOptions"
						  v-model="selectedCategory"
						  change-on-select
						></el-cascader>
					</el-form-item>
					<el-form-item label="店铺特点" style="white-space: nowrap;">
						<span>品牌保证</span>
						<el-switch on-text="" off-text="" v-model="formData.is_premium"></el-switch>
						<span>蜂鸟专送</span>
						<el-switch on-text="" off-text="" v-model="formData.delivery_mode"></el-switch>
						<span>新开店铺</span>
						<el-switch on-text="" off-text="" v-model="formData.new"></el-switch>
					</el-form-item>
					<el-form-item style="white-space: nowrap;">
						<span>外卖保</span>
						<el-switch on-text="" off-text="" v-model="formData.bao"></el-switch>
						<span>准时达</span>
						<el-switch on-text="" off-text="" v-model="formData.zhun"></el-switch>
						<span>开发票</span>
						<el-switch on-text="" off-text="" v-model="formData.piao"></el-switch>
					</el-form-item>
					<el-form-item label="配送费" prop="float_delivery_fee">
						<el-input-number v-model="formData.float_delivery_fee" :min="0" :max="20"></el-input-number>
					</el-form-item>
					<el-form-item label="起送价" prop="float_minimum_order_amount">
						<el-input-number v-model="formData.float_minimum_order_amount" :min="0" :max="100"></el-input-number>
					</el-form-item>
					<el-form-item label="营业时间" style="white-space: nowrap;">
						<el-time-select
							placeholder="起始时间"
							v-model="formData.startTime"
							:picker-options="{
							start: '05:30',
							step: '00:15',
							end: '23:30'
							}">
						</el-time-select>
						<el-time-select
							placeholder="结束时间"
							v-model="formData.endTime"
							:picker-options="{
							start: '05:30',
							step: '00:15',
							end: '23:30',
							minTime: formData.startTime
							}">
						</el-time-select>
					</el-form-item>

					<el-form-item label="上传店铺头像">
						<el-upload
						  class="avatar-uploader"
						  :action="baseUrl + '/v1/addimg/shop'"
						  :show-file-list="false"
						  :on-success="handleShopAvatarScucess"
						  :before-upload="beforeAvatarUpload">
						  <img v-if="formData.image_path" :src="baseImgPath + formData.image_path" class="avatar">
						  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
						</el-upload>
					</el-form-item>
					<el-form-item label="上传营业执照">
						<el-upload
						  class="avatar-uploader"
						  :action="baseUrl + '/v1/addimg/shop'"
						  :show-file-list="false"
						  :on-success="handleBusinessAvatarScucess"
						  :before-upload="beforeAvatarUpload">
						  <img v-if="formData.business_license_image" :src="baseImgPath + formData.business_license_image" class="avatar">
						  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
						</el-upload>
					</el-form-item>
					<el-form-item label="上传餐饮服务许可证">
						<el-upload
						  class="avatar-uploader"
						  :action="baseUrl + '/v1/addimg/shop'"
						  :show-file-list="false"
						  :on-success="handleServiceAvatarScucess"
						  :before-upload="beforeAvatarUpload">
						  <img v-if="formData.catering_service_license_image" :src="baseImgPath + formData.catering_service_license_image" class="avatar">
						  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
						</el-upload>
					</el-form-item>
					<el-form-item label="优惠活动">
						<el-select v-model="activityValue" @change="selectActivity" :placeholder="activityValue">
						    <el-option
						      	v-for="item in options"
						      	:key="item.value"
						      	:label="item.label"
						      	:value="item.value">
						    </el-option>
						</el-select>
					</el-form-item>
					<el-table
					    :data="activities"
					    style="min-width: 600px;margin-bottom: 20px;"
						align="cneter"
					    :row-class-name="tableRowClassName">
					    <el-table-column
					      prop="icon_name"
					      label="活动标题"
					      align="cneter"
					      width="120">
					    </el-table-column>
					    <el-table-column
					      prop="name"
					      label="活动名称"
					      align="cneter"
					      width="120">
					    </el-table-column>
					    <el-table-column
					      prop="description"
					      align="cneter"
					      label="活动详情">
					    </el-table-column>
					    <el-table-column
					    	label="操作"
					    	width="120">
					    <template scope="scope">
					        <el-button
					          size="small"
					          type="danger"
					          @click="handleDelete(scope.$index)">删除</el-button>
					    </template>
					    </el-table-column>
					</el-table>
					<el-form-item class="button_submit">
						<el-button type="primary" @click="submitForm('formData')">立即创建</el-button>
					</el-form-item>
				</el-form>
  			</el-col>
  		</el-row>
    </div>
</template>

<script>
    import headTop from '@/components/headTop'
    import {cityGuess, addShop, searchplace, foodCategory} from '@/api/getData'
    import {baseUrl, baseImgPath} from '@/config/env'
    export default {
    	data(){
    		return {
    			city: {},
    			formData: {
					name: '', //店铺名称
					address: '', //地址
					latitude: '',
					longitude: '',
					description: '', //介绍
					phone: '',
					promotion_info: '',
					float_delivery_fee: 5, //运费
					float_minimum_order_amount: 20, //起价
					is_premium: true,
					delivery_mode: true,
					new: true,
					bao: true,
					zhun: true,
					piao: true,
					startTime: '',
       	 			endTime: '',
       	 			image_path: '',
       	 			business_license_image: '',
       	 			catering_service_license_image: '',

		        },
		        rules: {
					name: [
						{ required: true, message: '请输入店铺名称', trigger: 'blur' },
					],
					address: [
						{ required: true, message: '请输入详细地址', trigger: 'blur' }
					],
					phone: [
						{ required: true, message: '请输入联系电话' },
						{ type: 'number', message: '电话号码必须是数字' }
					],
				},
				options: [{
		          	value: '满减优惠',
		          	label: '满减优惠'
		        }, {
		          	value: '优惠大酬宾',
		          	label: '优惠大酬宾'
		        }, {
		          	value: '新用户立减',
		          	label: '新用户立减'
		        }, {
		          	value: '进店领券',
		          	label: '进店领券'
		        }],
       	 		activityValue: '满减优惠',
				activities: [{
		        	icon_name: '减',
		        	name: '满减优惠',
		        	description: '满30减5，满60减8',
			    }],
			    baseUrl,
			    baseImgPath,
			    categoryOptions: [],
			    selectedCategory: ['快餐便当', '简餐']
    		}
    	},
    	components: {
    		headTop,
    	},
    	mounted(){
    		this.initData();
    	},
    	methods: {
    		async initData(){
    			try{
    				this.city = await cityGuess();
    				const categories = await foodCategory();
    				categories.forEach(item => {
    					if (item.sub_categories.length) {
    						const addnew = {
    							value: item.name,
						        label: item.name,
						        children: []
    						}
    						item.sub_categories.forEach((subitem, index) => {
    							if (index == 0) {
    								return
    							}
    							addnew.children.push({
    								value: subitem.name,
						        	label: subitem.name,
    							})
    						})
    						this.categoryOptions.push(addnew)

    					}
    				})
    			}catch(err){
    				console.log(err);
    			}
    		},
    		async querySearchAsync(queryString, cb) {
    			if (queryString) {
	    			try{
	    				const cityList = await searchplace(this.city.id, queryString);
	    				if (cityList instanceof Array) {
		    				cityList.map(item => {
		    					item.value = item.address;
		    					return item;
		    				})
		    				cb(cityList)
	    				}
	    			}catch(err){
	    				console.log(err)
	    			}
    			}
		    },
		    addressSelect(address){
		    	this.formData.latitude = address.latitude;
		    	this.formData.longitude = address.longitude;
		    	console.log(this.formData.latitude, this.formData.longitude)
		    },
			handleShopAvatarScucess(res, file) {
				if (res.status == 1) {
					this.formData.image_path = res.image_path;
				}else{
					this.$message.error('上传图片失败！');
				}
			},
			handleBusinessAvatarScucess(res, file) {
				if (res.status == 1) {
					this.formData.business_license_image = res.image_path;
				}else{
					this.$message.error('上传图片失败！');
				}
			},
			handleServiceAvatarScucess(res, file) {
				if (res.status == 1) {
					this.formData.catering_service_license_image = res.image_path;
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
			tableRowClassName(row, index) {
		        if (index === 1) {
		        	return 'info-row';
		        } else if (index === 3) {
		        	return 'positive-row';
		        }
		        return '';
		    },
		    selectActivity(){
		    	this.$prompt('请输入活动详情', '提示', {
		          	confirmButtonText: '确定',
		          	cancelButtonText: '取消',
		        }).then(({ value }) => {
		        	if (value == null) {
		        		this.$message({
				            type: 'info',
				            message: '请输入活动详情'
				        });
		        		return
		        	}
		          	let newObj = {};
		          	switch(this.activityValue){
		          		case '满减优惠':
		          			newObj= {
		          				icon_name: '减',
					        	name: '满减优惠',
					        	description: value,
		          			}
		          			break;
		          		case '优惠大酬宾':
		          			newObj= {
		          				icon_name: '特',
					        	name: '优惠大酬宾',
					        	description: value,
		          			}
		          			break;
		          		case '新用户立减':
		          			newObj= {
		          				icon_name: '新',
					        	name: '新用户立减',
					        	description: value,
		          			}
		          			break;
		          		case '进店领券':
		          			newObj= {
		          				icon_name: '领',
					        	name: '进店领券',
					        	description: value,
		          			}
		          			break;
		          	}
		          	this.activities.push(newObj);
		        }).catch(() => {
		          	this.$message({
		            	type: 'info',
		            	message: '取消输入'
		          	});
		        });
		    },
		    handleDelete(index){
		    	this.activities.splice(index, 1)
		    },
		    submitForm(formName) {
				this.$refs[formName].validate(async (valid) => {
					if (valid) {
						Object.assign(this.formData, {activities: this.activities}, {
							category: this.selectedCategory.join('/')
						})
						try{
							let result = await addShop(this.formData);
							if (result.status == 1) {
								this.$message({
					            	type: 'success',
					            	message: '添加成功'
					          	});
					          	this.formData = {
									name: '', //店铺名称
									address: '', //地址
									latitude: '',
									longitude: '',
									description: '', //介绍
									phone: '',
									promotion_info: '',
									float_delivery_fee: 5, //运费
									float_minimum_order_amount: 20, //起价
									is_premium: true,
									delivery_mode: true,
									new: true,
									bao: true,
									zhun: true,
									piao: true,
									startTime: '',
				       	 			endTime: '',
				       	 			image_path: '',
				       	 			business_license_image: '',
				       	 			catering_service_license_image: '',
						        };
						        this.selectedCategory = ['快餐便当', '简餐'];
						        this.activities = [{
						        	icon_name: '减',
						        	name: '满减优惠',
						        	description: '满30减5，满60减8',
							    }];
							}else{
								this.$message({
					            	type: 'error',
					            	message: result.message
					          	});
							}
							console.log(result)
						}catch(err){
							console.log(err)
						}
					} else {
						this.$notify.error({
							title: '错误',
							message: '请检查输入是否正确',
							offset: 100
						});
						return false;
					}
				});
			},
		}
    }
</script>

<style lang="less">
	@import '../style/mixin';
	.button_submit{
		text-align: center;
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
	.el-table .info-row {
	    background: #c9e5f5;
	}

	.el-table .positive-row {
	    background: #e2f0e4;
	}
</style>
 -->

