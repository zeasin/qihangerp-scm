<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="首页" name="VendorShipHome" >
        <vendor-ship-home></vendor-ship-home>
      </el-tab-pane>
      <el-tab-pane label="代发货订单" name="waitSendOrder" >
        <OrderItemWait></OrderItemWait>
      </el-tab-pane>
      <el-tab-pane label="已分配供应商发货订单" name="assigned" lazy>
        <vendor-ship-list></vendor-ship-list>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>

import VendorShipHome from "@/views/order/vendor_ship/home.vue";
import VendorShipList  from "@/views/order/vendor_ship/assigned_list.vue";
import OrderItemWait  from "@/views/order/vendor_ship/order_item_list.vue";

export default {
  name: "print",
  components:{VendorShipList,VendorShipHome,OrderItemWait},
  data() {
    return {
      activeName: 'VendorShipHome',
      typeList: [],
    };
  },
  created() {

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
