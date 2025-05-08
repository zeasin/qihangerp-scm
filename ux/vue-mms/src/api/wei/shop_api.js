import request from '@/utils/request'


// 接口拉取淘宝
export function pullWeiLogisticsCompanyList(data) {
  return request({
    url: '/api/open-api/wei/logistics/pull_logistics_company',
    method: 'post',
    data: data
  })
}
export function pullLogisticsTemplateListWei(data) {
  return request({
    url: '/api/open-api/wei/logistics/pullTemplateList',
    method: 'post',
    data: data
  })
}
