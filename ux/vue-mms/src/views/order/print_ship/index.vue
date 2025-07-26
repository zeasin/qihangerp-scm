<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="首页" name="printHome" >
        <print-home></print-home>
      </el-tab-pane>
      <el-tab-pane v-for="item in typeList" :label="item.name" :name="item.code" lazy>
<!--        <print-tao v-if="item.id == 100"></print-tao>-->
<!--        <print-jd v-if="item.id == 200"></print-jd>-->
<!--        <print-jdvc v-if="item.id == 280"></print-jdvc>-->
        <print-pdd v-if="item.id == 300"></print-pdd>
<!--        <print-dou v-if="item.id == 400"></print-dou>-->
<!--        <print-wei v-if="item.id == 500"></print-wei>-->
<!--        <print-offline v-if="item.id == 999"></print-offline>-->
      </el-tab-pane>

    </el-tabs>

  </div>
</template>

<script>

import printPdd from "@/views/order/print_ship/pdd/index.vue";

import PrintHome from "@/views/order/print_ship/home.vue";

import {listPlatform} from "@/api/shop/shop";

export default {
  name: "print",
  components:{
    printPdd,PrintHome},
  data() {
    return {
      activeName: 'printHome',
      typeList: [],
    };
  },
  created() {

  },
  mounted() {
    listPlatform({status:0}).then(res => {
      this.typeList = res.rows.filter(x=>x.id!=999);
      // this.activeName = this.typeList[0].code
    })
  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    }
  }
};
</script>
