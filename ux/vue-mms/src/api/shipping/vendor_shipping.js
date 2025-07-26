import request from '@/utils/request'


export function listVendorShipOrder(query) {
  return request({
    url: '/api/oms-api/ship/vendor/assigned_list',
    method: 'get',
    params: query
  })
}
// 分配给供应商发货
export function distributeSupplierShip(data) {
  return request({
    url: '/api/oms-api/ship/vendor/supplier_ship_dist',
    method: 'post',
    data: data
  })
}

// 获取共享给供应商电子面单
export function listWaybillAccountShareVendor(query) {
  return request({
    url: '/api/oms-api/ship/vendor/waybill_accounts_share_list',
    method: 'get',
    params: query
  })
}
