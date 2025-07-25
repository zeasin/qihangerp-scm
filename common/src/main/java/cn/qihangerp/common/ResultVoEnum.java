package cn.qihangerp.common;
/**
 * 描述：
 * 结果枚举
 *
 * @author qlp
 * @date 2019-04-10 10:31
 */
public enum ResultVoEnum {
    SUCCESS("成功", 0),
    UPDATE_SUCCESS("更新成功", 1),
    TokenFail("Token失效",1401),
    NotFound("NotFound", 1404),//没有找到
    Unable("Unable", 1403),//无法处理
//    NotLogin("未登录", 400),//未登录
    Cancelled("Cancelled", 1408),//已经取消的
    StateError("StateError", 1402),//状态错误
    Locking("Locking", 1405),//锁定，不能操作
    NumberLess("数量不足", 1406),
    StatusError("状态不正确", 1407),
    DataError("DataError", 1500),//数据错误，不能操作
    DataExist("DataExist", 1800),//数据已存在，不能操作
    ParamsError("参数错误", 1505),//参数错误
    HasAssociatedData("存在关联数据", 1501),//存在关联数据
    Exist("已存在相同的数据", 1502),//已存在相同的数据
    SystemException("系统异常", 1505),//系统异常
//    TokenFail("token过期", 1401),//ali token过期
    Fail("失败", 1000);

    private String name;
    private int index;

    // 构造方法
    private ResultVoEnum(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static String getName(int index) {
        for (ResultVoEnum c : ResultVoEnum.values()) {
            if (c.getIndex() == index) {
                return c.name;
            }
        }
        return null;
    }

    // get set 方法
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
