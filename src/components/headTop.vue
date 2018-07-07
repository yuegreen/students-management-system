<template>
    <div class="header_container">

		<el-breadcrumb separator="/">
			<!-- <el-breadcrumb-item :to="{ path: '/stuManage' }">首页</el-breadcrumb-item> -->
			<el-breadcrumb-item v-if="adminInfo.stuId > 0" :to="{ path: '/stuManage' }">首页</el-breadcrumb-item>
			<el-breadcrumb-item v-else-if="adminInfo.teacherId > 0" :to="{ path: '/teaManage' }">首页</el-breadcrumb-item>
			<el-breadcrumb-item v-else="adminInfo.id > 0" :to="{ path: '/manage' }">首页</el-breadcrumb-item>
			<el-breadcrumb-item v-for="(item, index) in $route.meta">{{item}}</el-breadcrumb-item>
		</el-breadcrumb>
		
		<el-dropdown @command="handleCommand" menu-align='start'>
			<!-- <img :src="baseImgPath + adminInfo.avatar" class="avator"> -->
			<el-tag class="avator" v-if="adminInfo.stuId > 0">{{ adminInfo.name }}</el-tag>
			<el-tag class="avator" v-else-if="adminInfo.teacherId > 0">{{ adminInfo.name }}</el-tag>
			<el-tag class="avator" v-else="adminInfo.id > 0">{{ adminInfo.username }}</el-tag>
			<el-dropdown-menu slot="dropdown">
				<!-- <el-dropdown-item command="home">首页</el-dropdown-item> -->
				<el-dropdown-item command="singout">退出</el-dropdown-item>
			</el-dropdown-menu>
		</el-dropdown>
    </div>
</template>

<script>
	import {login,signout} from '@/api/getData'
	import {baseImgPath} from '@/config/env'
	import {mapActions, mapState} from 'vuex'

    export default {
    	data(){
    		return {
    			baseImgPath,
    		}
    	},
    	created(){
    		if (!this.adminInfo.id) {
    			this.getAdminData()
    		}
    	},
    	computed: {
    		...mapState(['adminInfo']),
    	},
		methods: {
			...mapActions(['getAdminData']),
			async handleCommand(command) {
				// if (command == 'home') {
				// 	const res1 = await home()
				// 	if (res1.status == 0) {
				// 		this.$router.push('/stuManage');
				// 	} else if (res1.status == 1) {
				// 		this.$router.push('/teaManage');
				// 	} else if (res1.status == 2){
				// 		this.$router.push('/manage');
				// 	} else {
				// 		this.$router.push('/');
				// 	}
				// }else 
				if(command == 'singout'){
					const res = await signout()
					if (res.status == 0 || res.status == 1 || res.status == 2) {
						this.$message({
	                        type: 'success',
	                        message: '退出成功'
	                    });
	                    this.$router.push('/');
					}
					else{
						this.$message({
	                        type: 'error',
	                        message: res.message
	                    });
					}
				}
			},
		}
    }
</script>

<style lang="less">
	@import '../style/mixin';
	.header_container{
		background-color: #EFF2F7;
		height: 60px;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding-left: 20px;
	}
	.avator{
		.wh(50px, 50px);
		border-radius: 50%;
		margin-right: 37px;
		padding-top: 10px;
		text-align: center;
	}
	.el-dropdown-menu__item{
        text-align: center;
    }
</style>
