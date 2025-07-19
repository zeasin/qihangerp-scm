import request from '@/utils/request'

// export function listLogistics(query) {
//   return request({
//     url: '/api/supplier-api/shop/logistics',
//     method: 'get',
//     params: query
//   })
// }
export function listLogisticsStatus(query) {
  return request({
    url: '/api/vms-api/logistics/company_list',
    method: 'get',
    params: query
  })
}


// 新增物流公司
export function addLogistics(data) {
  return request({
    url: '/api/vms-api/logistics/add',
    method: 'post',
    data: data
  })
}

// // 查询物流公司详细
// export function getLogistics(id) {
//   return request({
//     url: '/api/oms-api/logistics/' + id,
//     method: 'get'
//   })
// }


// 修改物流公司
export function updateLogistics(data) {
  return request({
    url: '/api/vms-api/logistics',
    method: 'put',
    data: data
  })
}

// // 删除物流公司
// export function delLogistics(id) {
//   return request({
//     url: '/api/oms-api/logistics/' + id,
//     method: 'delete'
//   })
// }

// 修改物流状态
export function updateStatus(data) {
  return request({
    url: '/api/vms-api/logistics/updateStatus',
    method: 'put',
    data: data
  })
}
