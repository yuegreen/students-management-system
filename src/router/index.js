import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const login = r => require.ensure([], () => r(require('@/page/login')), 'login');
const stuManage = r => require.ensure([], () => r(require('@/page/stuManage')), 'manage');
const manage = r => require.ensure([], () => r(require('@/page/manage')), 'manage');
const teaManage = r => require.ensure([], () => r(require('@/page/teaManage')), 'teaManage');
const home = r => require.ensure([], () => r(require('@/page/home')), 'home');
const addShop = r => require.ensure([], () => r(require('@/page/addShop')), 'addShop');
const addGoods = r => require.ensure([], () => r(require('@/page/addGoods')), 'addGoods');
const userList = r => require.ensure([], () => r(require('@/page/userList')), 'userList');
const shopList = r => require.ensure([], () => r(require('@/page/shopList')), 'shopList');
const foodList = r => require.ensure([], () => r(require('@/page/foodList')), 'foodList');
const orderList = r => require.ensure([], () => r(require('@/page/orderList')), 'orderList');
const adminList = r => require.ensure([], () => r(require('@/page/adminList')), 'adminList');
const visitor = r => require.ensure([], () => r(require('@/page/visitor')), 'visitor');
const newMember = r => require.ensure([], () => r(require('@/page/newMember')), 'newMember');
const uploadImg = r => require.ensure([], () => r(require('@/page/uploadImg')), 'uploadImg');
const vueEdit = r => require.ensure([], () => r(require('@/page/vueEdit')), 'vueEdit');
const adminSet = r => require.ensure([], () => r(require('@/page/adminSet')), 'adminSet');
const sendMessage = r => require.ensure([], () => r(require('@/page/sendMessage')), 'sendMessage');
const explain = r => require.ensure([], () => r(require('@/page/explain')), 'explain');

const routes = [
	{
		path: '/',
		component: login
	},
	{
		path: '/manage',
		component: manage,
		name: '',
		children: [{
			path: '',
			component: home,
			meta: [],
		},{
			path: '/addShop',
			component: addShop,
			meta: ['教师管理', '账号管理'],
		},{
			path: '/addGoods',
			component: addGoods,
			meta: ['教师管理', '添加商品'],
		},{
			path: '/userList',
			component: userList,
			meta: ['学分模块管理', '学分类别规则管理'],
		},{
			path: '/shopList',
			component: shopList,
			meta: ['学分模块管理', '学生资料管理'],
		},{
			path: '/visitor',
			component: visitor,
			meta: ['学生管理', '账号管理'],
		},{
			path: '/newMember',
			component: newMember,
			meta: ['图表', '用户数据'],
		}]
	},//教师管理模块
	{
		path: '/teaManage',
		component: teaManage,
		name: '',
		children: [{
			path: '',
			component: home,
			meta: [],
		},{
			path: '/uploadImg',
			component: uploadImg,
			meta: ['资料管理', '资料审核'],
		},{
			path: '/vueEdit',
			component: vueEdit,
			meta: ['学生管理', '查看学生信息'],
		},{
			path: '/adminSet',
			component: adminSet,
			meta: ['设置', '修改密码'],
		},{
			path: '/sendMessage',
			component: sendMessage,
			meta: ['设置', '发送通知'],
		}]
	},  //学生管理模块
	{
		path: '/stuManage',
		component: stuManage,
		name: '',
		children: [{
			path: '',
			component: home,
			meta: [],
		},{
			path: '/foodList',
			component: foodList,
			meta: ['认定创新学分', '查看我的项目'],  //查看创新学分
		},{
			path: '/orderList',
			component: orderList,
			meta: ['认定创新学分', '上传创新项目'],  //上传创新学分材料
		},{
			path: '/adminList',
			component: adminList,
			meta: ['认定创新学分', '修改我的项目'],  //修改项目
		},{
			path: '/explain',
			component: explain,
			meta: ['用户管理', '修改密码'],   //修改学生用户密码
		}]
	}
]

export default new Router({
	routes,
	strict: process.env.NODE_ENV !== 'production',
})
