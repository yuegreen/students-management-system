<template>
    <div>
        <head-top></head-top>
        <div class="message_style">
            <p class="mes_title">消息通告</p>
            <div class="mes_content">
                <p class="cont_title">关于举办创新创业教育讲座的通知</p>
                <p>全校师生：</p>
                <p><span class="indent"></span>为在我校营造良好的创新创业氛围，普及创新创业相关知识，特邀请三位企业负责人为我校学子作创新创业教育讲座，涉及大学生如何精准就业与创业，如何把握创业趋势，剖析年轻人走入社会后谋生和事业间的关系，以及对人生进阶过程中时、局、势的把握，如何实现高效人生等精彩内容。 
                </p>
                <p><span class="indent"></span>具体安排如下：</p>
                <p><span class="indent"></span>一、时间：2018年5月10日（周四）晚上18：30-20：00</p>
                <p><span class="indent"></span>二、地点：黄家湖校区崇实会堂</p>
                <p><span class="indent"></span>三、主讲人</p>
                <p><span class="indent"></span>1、符乃良，海口汉琼实业有限公司、湖北中钢联冶金工程有限公司董事长、江汉区工商联副会长。</p>
                <p><span class="indent"></span>2、罗勇，武汉弃疾医院管理有限公司、武汉微伽健康传播有限公司董事长。</p>
                <p><span class="indent"></span>3、吴   坤，武汉珺寅文化发展有限公司董事长、湖北远福机电设备有限公司执行总裁、湖北省青年创业促进会纪委书记、常务副会长。</p>
                <p><span class="indent"></span>备注：请参加讲座的同学携带本人一卡通，刷卡签到。参加5次创新创业讲座、培训、沙龙等活动可以认定1个“创新创业学分”。</p>
                <p><span class="indent"></span>欢迎广大师生踊跃参加！</p>
                <p class="end_style">创新创业学院</p>
                <p class="end_style">2018年5月8日 </p>
            </div>
        </div>
		<!-- <section class="data_section">
			<header class="section_title">数据统计</header>
			<el-row :gutter="20" style="margin-bottom: 10px;">
                <el-col :span="4"><div class="data_list today_head"><span class="data_num head">当日数据：</span></div></el-col>
				<el-col :span="4"><div class="data_list"><span class="data_num">{{userCount}}</span> 新增用户</div></el-col>
				<el-col :span="4"><div class="data_list"><span class="data_num">{{orderCount}}</span> 新增订单</div></el-col>
                <el-col :span="4"><div class="data_list"><span class="data_num">{{adminCount}}</span> 新增管理员</div></el-col>
			</el-row>
            <el-row :gutter="20">
                <el-col :span="4"><div class="data_list all_head"><span class="data_num head">总数据：</span></div></el-col>
                <el-col :span="4"><div class="data_list"><span class="data_num">{{allUserCount}}</span> 注册用户</div></el-col>
                <el-col :span="4"><div class="data_list"><span class="data_num">{{allOrderCount}}</span> 订单</div></el-col>
                <el-col :span="4"><div class="data_list"><span class="data_num">{{allAdminCount}}</span> 管理员</div></el-col>
            </el-row>
		</section>
		<tendency :sevenDate='sevenDate' :sevenDay='sevenDay'></tendency> -->
    </div>
</template>

<script>
	import headTop from '../components/headTop'
	// import dtime from 'time-formater'
	// import {userCount, orderCount, getUserCount, getOrderCount, adminDayCount, adminCount} from '@/api/getData'
    export default {
    	data(){
    		return {
    			// userCount: null,
    			// orderCount: null,
       //          adminCount: null,
       //          allUserCount: null,
       //          allOrderCount: null,
       //          allAdminCount: null,
    			// sevenDay: [],
    			// sevenDate: [[],[],[]],
    		}
    	},
    	components: {
    		headTop,
    		// tendency,
    	},
    	mounted(){
    		// this.initData();
    		// for (let i = 6; i > -1; i--) {
    		// 	const date = dtime(new Date().getTime() - 86400000*i).format('YYYY-MM-DD')
    		// 	this.sevenDay.push(date)
    		// }
    		// this.getSevenData();
    	},
        computed: {

        },
    	methods: {
    	// 	async initData(){
    	// 		const today = dtime().format('YYYY-MM-DD')
    	// 		Promise.all([userCount(today), orderCount(today), adminDayCount(today), getUserCount(), getOrderCount(), adminCount()])
    	// 		.then(res => {
    	// 			this.userCount = res[0].count;
    	// 			this.orderCount = res[1].count;
     //                this.adminCount = res[2].count;
     //                this.allUserCount = res[3].count;
     //                this.allOrderCount = res[4].count;
     //                this.allAdminCount = res[5].count;
    	// 		}).catch(err => {
    	// 			console.log(err)
    	// 		})
    	// 	},
    	// 	async getSevenData(){
    	// 		const apiArr = [[],[],[]];
    	// 		this.sevenDay.forEach(item => {
    	// 			apiArr[0].push(userCount(item))
    	// 			apiArr[1].push(orderCount(item))
     //                apiArr[2].push(adminDayCount(item))
    	// 		})
    	// 		const promiseArr = [...apiArr[0], ...apiArr[1], ...apiArr[2]]
    	// 		Promise.all(promiseArr).then(res => {
    	// 			const resArr = [[],[],[]];
					// res.forEach((item, index) => {
					// 	if (item.status == 1) {
					// 		resArr[Math.floor(index/7)].push(item.count)
					// 	}
					// })
					// this.sevenDate = resArr;
    	// 		}).catch(err => {
    	// 			console.log(err)
    	// 		})
    	// 	}
    	}
    }
</script>

<style lang="less">
	@import '../style/mixin';
	.data_section{
		padding: 20px;
		margin-bottom: 40px;
		.section_title{
			text-align: center;
			font-size: 30px;
			margin-bottom: 10px;
		}
		.data_list{
			text-align: center;
			font-size: 14px;
			color: #666;
            border-radius: 6px;
            background: #E5E9F2;
            .data_num{
                color: #333;
                font-size: 26px;

            }
            .head{
                border-radius: 6px;
                font-size: 22px;
                padding: 4px 0;
                color: #fff;
                display: inline-block;
            }
        }
        .today_head{
            background: #FF9800;
        }
        .all_head{
            background: #20A0FF;
        }
	}
    .wan{
        .sc(16px, #333)
    }
    .message_style{
        margin: 10px;
        padding: 10px;
        .mes_title{
            margin-bottom: 10px;
            text-align: center;
            font-size: 18px;
            color: #58b1f6;
            font-weight: bold;
        }        
        .cont_title{
            text-align: center;
            color: #48576a;
        }
        p{
            margin: 10px;
            color: #b0b1b2;
        }
        .indent{
            display: inline-block;
            width: 36px;
            height: 20px;
        }
        .end_style{
            text-align: right;
        }
    }
    
</style>
