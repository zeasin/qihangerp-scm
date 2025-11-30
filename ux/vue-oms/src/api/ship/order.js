import request from '@/utils/request'

// 查询物流公司列表
export function listOrder(query) {
  return request({
    url: '/erp-api/order/list',
    method: 'get',
    params: query
  })
}

// 查询物流公司详细
export function getOrder(id) {
  return request({
    url: '/erp-api/order/' + id,
    method: 'get'
  })
}
