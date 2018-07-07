<template>
	<div class="manage_page fillcontain">
		<el-row style="height: 100%;">
	  		<el-col :span="4"  style="min-height: 100%; background-color: #324057;">
				<el-menu :default-active="defaultActive" style="min-height: 100%;" theme="dark" router>
					<el-menu-item index="stuManage" style="font-size: 16px;color:pink;"><!-- <i class="el-icon-menu"></i> -->创新学分管理学生界面</el-menu-item>
					<el-submenu index="1">
						<template slot="title"><i class="el-icon-document"></i>认定创新学分</template>
						<el-menu-item index="foodList">查看我的项目</el-menu-item>
						<el-menu-item index="orderList">上传创新项目</el-menu-item>
					</el-submenu>
					<!-- <el-submenu index="3">
						<template slot="title"><i class="el-icon-plus"></i>教师管理</template>
						<el-menu-item index="addShop">添加账号</el-menu-item>
						<el-menu-item index="addGoods">账号管理</el-menu-item>
					</el-submenu>
					<el-submenu index="4">
						<template slot="title"><i class="el-icon-star-on"></i>学生管理</template>
						<el-menu-item index="visitor">用户分布</el-menu-item>
						<el-menu-item index="newMember">用户数据</el-menu-item> -->
					<!--</el-submenu>
					<el-submenu index="5">
						<template slot="title"><i class="el-icon-edit"></i>编辑</template>
						<el-menu-item index="uploadImg">上传图片</el-menu-item>
						<el-menu-item index="vueEdit">文本编辑</el-menu-item>
					</el-submenu>
					<el-submenu index="6">
						<template slot="title"><i class="el-icon-setting"></i>设置</template>
						<el-menu-item index="adminSet">管理员设置</el-menu-item>
						el-menu-item index="sendMessage">发送通知</el-menu-item> -->
					</el-submenu>
					<el-submenu index="2">
						<template slot="title"><i class="el-icon-warning"></i>用户管理</template>
						<el-menu-item index="explain">修改密码</el-menu-item>
					</el-submenu>
				</el-menu>
			</el-col>
			<el-col :span="20" style="height: 100%;overflow: auto;">
				<keep-alive>
				    <router-view></router-view>
				</keep-alive>
			</el-col>
		</el-row>
  	</div>
</template>

<script>
    export default {
		computed: {
			defaultActive: function(){
				return this.$route.path.replace('/', '');
			}
		},
    }
</script>


<style lang="less" scoped>
	@import '../style/mixin';
	.manage_page{

	}
</style>
