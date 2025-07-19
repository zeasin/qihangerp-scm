import request from '@/utils/request'

// 列表
export function getWaybillAccountList(params) {
  return request({
    url: '/api/vms-api/vendor/ewaybill/get_waybill_account_list',
    method: 'get',
    params: params
  })
}

// 快递模块列表
export function getWaybillTemplateList(params) {
  return request({
    url: '/api/vms-api/vendor/ewaybill/get_waybill_template_list',
    method: 'get',
    params: params
  })
}

// 更新电子面单账户
export function pullWaybillAccount(data) {
  return request({
    url: '/api/vms-api/vendor/ewaybill/pull_waybill_account',
    method: 'post',
    data: data
  })
}
// 更新快递公司模块
export function pullWaybillTemplat(data) {
  return request({
    url: '/shop/ewaybill/pull_waybill_template',
    method: 'post',
    data: data
  })
}
// 取号并发货
export function getWaybillCodeAndSend(data) {
  return request({
    url: '/shop/ewaybill/get_waybill_code_and_send',
    method: 'post',
    data: data
  })
}


// 取号
export function getWaybillCode(data) {
  return request({
    url: '/open-api/wei/ewaybill/get_waybill_code',
    method: 'post',
    data: data
  })
}

// 获取打印的数据
export function getWaybillPrintData(data) {
  return request({
    url: '/shop/ewaybill/get_print_data',
    method: 'post',
    data: data
  })
}

// 打印成功
export function pushWaybillPrintSuccess(data) {
  return request({
    url: '/shop/ewaybill/push_print_success',
    method: 'post',
    data: data
  })
}




export function updateAccount(data) {
  return request({
    url: '/api/vms-api/vendor/ewaybill/updateAccount',
    method: 'post',
    data: data
  })
}
