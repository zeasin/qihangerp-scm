package cn.qihangerp.common.enums;

/**
 * 描述：
 * 店铺类型Enum
 *
 * @author qlp
 * @date 2019-09-18 19:44
 */
public enum EnumShopType {
    TAO("淘宝天猫", 100),
    JD("京东POP", 200),
    JDVC("京东自营", 280),
    PDD("拼多多", 300),
    DOU("抖店", 400),
    WEI("微信小店", 500),
    KWAI("快手小店", 600),
    XHS("小红书", 700),
    WEI_DIAN("微店", 901),
    OFFLINE("线下其他", 999),
    SHOP("其他", 0)
    ;
    private String name;
    private int index;

    // 构造方法
    private EnumShopType(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static String getName(int index) {
        for (EnumShopType c : EnumShopType.values()) {
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
