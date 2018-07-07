<template>
    <div class="fillcontain">
        <head-top></head-top>
        <div class="table_container">

          <el-input
              placeholder="输入关键字进行过滤"
              v-model="filterText">
          </el-input>
          <el-row type="flex" class="row-bg">
            <el-col :span="11"><div class="grid-content bg-purple-left">标题</div></el-col>
            <el-col :span="11"><div class="grid-content bg-purple">操作</div></el-col>
          </el-row>
          <div class="custom-tree-container">
            <div class="block">
              <el-tree
                class="filter-tree"
                :data="treeData"
                :props="defaultProps"
                accordion
                @node-click="handleNodeClick"
                :filter-node-method="filterNode"
                ref="ruleTree">
              </el-tree>
            </div>
          </div>

        </div>
    </div>
</template>

<script>
    import headTop from '../components/headTop'
    import {getUserList, getUserCount, getJudgeRuleById} from '@/api/getData'
    let id = 1000;

    export default {
      data() {
          return {
            filterText: '',
            treeData: [],
            defaultProps: {
                children: 'children',
                label: 'rule'
            }
        };
      },
      watch: {
              filterText(val) {
                  this.$refs.ruleTree.filter(val);
              }
      },
    	components: {
    		headTop,
    	},
      created(){
            this.initData();
      },
      methods: {
          async initData(){
            try{
                const result = await getJudgeRuleById({id:1});
                    if (result.status == 0) {
                    this.treeData = result.data;
                } else{
                    throw new Error('获取数据失败');
                }
            } catch(err){
                console.log('获取数据失败', err);
            }
          },
          filterNode(value, data) {
              if (!value) return true;
              return data.rule.indexOf(value) !== -1;
          },
          handleNodeClick(data) {
          console.log(data);
          }
        },
    }
</script>

<style lang="less">
	@import '../style/mixin';
    .table_container{
        padding: 20px;
        .title_tip {

        }
    }
    .el-row {
      margin-bottom: 20px;
      border-radius: 4px;    }
    .el-col {
      border-radius: 4px;

    }
    .grid-content {
      min-height: 10px;
      padding: 2px;
      text-align: center;
    }
    .row-bg {
      padding: 10px 0;
      background-color: #767f82;
      color: #dae7eb;
    }
    .bg-purple-left {
      border-right: 2px #dae7eb solid;
      margin-right: -20px;
    }
    .bg-purple {
      margin-left: 30px;
    }
</style>
