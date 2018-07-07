import Vue from 'vue'
import Vuex from 'vuex'
import {getAdminInfo} from '@/api/getData'

Vue.use(Vuex)

const state = {
	adminInfo: {
		avatar: 'default.jpg'
	},
}
// const state = {
// 	adminInfo: {	
// 	},
// }

const mutations = {
	saveAdminInfo(state, adminInfo){
		state.adminInfo = adminInfo;
	}
}
// const mutations = {
// 	saveStuInfo(state, stuInfo){
// 		state.stuInfo = stuInfo;
// 	}
// }

const actions = {
	async getAdminData({commit}){
		try{
			const res = await getAdminInfo()
			if (res.status == 0) {
				commit('saveAdminInfo', res.data);
			}else if (res.status == 1) {
				commit('saveAdminInfo', res.data);
			}else if (res.status == 2) {
				commit('saveAdminInfo', res.data);
			}
			else{
				throw new Error(res)
			}
		}catch(err){
			console.log('您尚未登陆或者session失效')
		}
	}
}
// const actions = {
// 	async getAdminData({commit}){
// 		try{
// 			const res = await getAdminInfo()
// 			if (res.status == 0) {
// 				commit('saveAdminInfo', res.data);
// 			}else{
// 				throw new Error(res)
// 			}
// 		}catch(err){
// 			console.log('您尚未登陆或者session失效')
// 		}
// 	}
// }

export default new Vuex.Store({
	state,
	actions,
	mutations,
})