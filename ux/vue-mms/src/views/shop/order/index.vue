<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">

      <el-tab-pane label="微信小店" name="weiOrder">
        <order-wei></order-wei>
      </el-tab-pane>

      <el-tab-pane label="其他" name="qt" lazy>
        <order-qt></order-qt>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>

import OrderWei  from "@/views/shop/order/wei";
import OrderQt  from "@/views/shop/order/qt";

export default {
  name: "Order",
  components:{OrderQt,OrderWei},
  data() {
    return {
      activeName: 'weiOrder'
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
