<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">

      <el-tab-pane label="商户共享电子面单" name="shareEwaybillAccount" lazy>
        <share-waybill-account></share-waybill-account>
      </el-tab-pane>
      <el-tab-pane label="店铺电子面单" name="shopEwaybillAccount" lazy>
        <shop-waybill-account></shop-waybill-account>
      </el-tab-pane>

      <el-tab-pane label="快递公司管理" name="LogisticsCompany" >
        <logistics-company></logistics-company>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
import LogisticsCompany from "@/views/vms/shipping/setting/logistics_company";
import ShareWaybillAccount from "@/views/vms/shipping/setting/share_ewaybill_account/index.vue"
import ShopWaybillAccount from "@/views/vms/shipping/setting/shop_ewaybill_account/index.vue"

export default {
  name: "set",
  components:{
    LogisticsCompany,ShopWaybillAccount,ShareWaybillAccount
  },
  data() {
    return {
      activeName: 'shareEwaybillAccount',
      typeList: [],
    };
  },
  created() {

  },
  mounted() {
    if(this.$route.query.tag){
      this.activeName = this.$route.query.tag
    }
  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    }
  }
};
</script>
