<template>
	<div class="manage_page fillcontain">
		<el-row style="height: 100%;">
	  		<el-col :span="4"  style="min-height: 100%; background-color: #324057;">
				<el-menu :default-active="defaultActive" style="min-height: 100%;" theme="dark" router>
					<el-menu-item index="teaManage" style="font-size: 16px;color:#00a0e9;"><!-- <i class="el-icon-menu"></i> -->创新学分管理老师界面</el-menu-item>
					<el-submenu index="1">
						<template slot="title"><i class="el-icon-edit"></i>资料管理</template>
						<el-menu-item index="uploadImg">资料审核</el-menu-item>
					</el-submenu>
					<el-submenu index="2">
						<template slot="title"><i class="el-icon-edit"></i>学生管理</template>
						<el-menu-item index="vueEdit">查看学生信息</el-menu-item>
					</el-submenu>					
					<el-submenu index="3">
						<template slot="title"><i class="el-icon-setting"></i>设置</template>
						<el-menu-item index="adminSet">修改密码</el-menu-item>
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
