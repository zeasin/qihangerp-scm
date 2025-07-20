import request from '@/utils/request'

// 查询退换货列表
export function listReturned(query) {
  return request({
    url: '/scm-oms-api/afterSale/returned_list',
    method: 'get',
    params: query
  })
}

// 查询退换货详细
export function getAfterSale(id) {
  return request({
    url: '/scm-oms-api/afterSale/detail/' + id,
    method: 'get'
  })
}

