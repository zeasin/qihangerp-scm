import request from '@/utils/request'

// 查询商品管理列表
export function listGoods(query) {
  return request({
    url: '/api/vms-api/goods/list',
    method: 'get',
    params: query
  })
}



// 查询商品管理详细
export function getGoods(id) {
  return request({
    url: '/api/vms-api/goods/' + id,
    method: 'get'
  })
}

// 查询商品规格列表
export function searchSku(query) {
  return request({
    url: '/api/vms-api/goods/searchSku',
    method: 'get',
    params: query
  })
}
