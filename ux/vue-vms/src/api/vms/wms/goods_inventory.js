import request from '@/utils/request'

// 查询商品库存列表
export function listGoodsInventory(query) {
  return request({
    url: '/api/vms-api/goodsInventory/list',
    method: 'get',
    params: query
  })
}

// 查询商品库存详细
export function getGoodsInventory(id) {
  return request({
    url: '/api/vms-api/goodsInventory/' + id,
    method: 'get'
  })
}

export function searchSkuInventoryBatch(query) {
  return request({
    url: '/api/vms-api/goodsInventory/searchSkuInventoryBatch',
    method: 'get',
    params: query
  })
}
