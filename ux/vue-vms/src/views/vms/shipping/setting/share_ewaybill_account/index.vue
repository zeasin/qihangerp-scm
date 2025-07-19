<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick" type="border-card">
<!--      <el-tab-pane label="拼多多" name="pdd">-->
<!--        <waybill-account-pdd></waybill-account-pdd>-->
<!--      </el-tab-pane>-->
<!--      <el-tab-pane label="微信小店" name="wei" lazy>-->
<!--        <waybill-account-wei></waybill-account-wei>-->
<!--      </el-tab-pane>-->

      <el-tab-pane v-for="item in typeList" :label="item.name" :name="item.code" lazy>
        <waybill-account-tao v-if="item.id === 100"></waybill-account-tao>
        <waybill-account-jd v-if="item.id === 200"></waybill-account-jd>
        <waybill-account-pdd v-if="item.id === 300"></waybill-account-pdd>
        <waybill-account-dou v-if="item.id === 400"></waybill-account-dou>
        <waybill-account-wei v-if="item.id === 500"></waybill-account-wei>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>

import WaybillAccountTao from "@/views/vms/shipping/setting/share_ewaybill_account/tao.vue";
import WaybillAccountJd from "@/views/vms/shipping/setting/share_ewaybill_account/jd.vue";
import WaybillAccountPdd from "@/views/vms/shipping/setting/share_ewaybill_account/pdd.vue";
import WaybillAccountDou from "@/views/vms/shipping/setting/share_ewaybill_account/dou.vue";
import WaybillAccountWei from "@/views/vms/shipping/setting/share_ewaybill_account/wei.vue";
import {listPlatform} from "@/api/vms/shop";
export default {
  name: "EwaybillAccount",
  components:{
    WaybillAccountPdd,
    WaybillAccountWei,
    WaybillAccountTao,
    WaybillAccountJd,
    WaybillAccountDou
  },
  data() {
    return {
      activeName: '',
      typeList: [],
    };
  },
  created() {
    listPlatform({status:0}).then(res => {
      this.typeList = res.rows.filter(x=>x.id!=999);
      this.activeName = this.typeList[0].code
    })
  },
  mounted() {

  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    }
  }
};
</script>
