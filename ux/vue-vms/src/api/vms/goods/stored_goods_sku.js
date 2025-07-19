import request from '@/utils/request'

// 查询商品管理列表
export function listStoredGoodsSku(query) {
  return request({
    url: '/api/vms-api/stored_goods_sku/list',
    method: 'get',
    params: query
  })
}


export function listStoredMerchant(query) {
  return request({
    url: '/api/vms-api/stored_goods_sku/merchant_list',
    method: 'get',
    params: query
  })
}
