<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">

      <el-tab-pane label="待发货" name="waitShip">
        <order-wait-ship></order-wait-ship>
      </el-tab-pane>

      <el-tab-pane label="已发货" name="shipped" lazy>
        <order-shipped-list></order-shipped-list>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>

import OrderWaitShip  from "@/views/shop/order/wait_ship.vue";
import OrderShippedList  from "@/views/shop/order/shipped_list.vue";

export default {
  name: "Order",
  components:{OrderWaitShip, OrderShippedList},
  data() {
    return {
      activeName: 'waitShip'
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
