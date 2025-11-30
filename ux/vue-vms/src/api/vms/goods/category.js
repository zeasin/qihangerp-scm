import request from '@/utils/request'

// 查询商品分类列表
export function listCategory(query) {
  return request({
    url: '/scm-api/goods/category/list',
    method: 'get',
    params: query
  })
}
