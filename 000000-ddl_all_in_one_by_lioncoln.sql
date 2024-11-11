-- ddl_all_in_one_by_lioncoln.sql

-- 城区表
drop table if exists ods_house_zoning_district_da;

create table if not exists ods_house_zoning_district_da

(

     id           bigint comment " 编号"

    , name         string comment " 名称,默认值为:'' "

    , full_spell   string comment " 全拼,默认值为:'' "

    , sorted_seq       bigint comment " 排序,默认值为:0 "

    , state        bigint comment " 状态：0，新建1，有效2，无效,默认值为:0 "

    , city_id      bigint comment " 城市ID,默认值为:0 "

    , cuser        bigint comment " 新建人编号,默认值为:0 "

    , ctime        string comment " 新建时间,默认值为:1000-01-01 00:00:00 "

    , muser        bigint comment " 修改人编号,默认值为:0 "

    , mtime        string comment " 修改时间,默认值为:CURRENT_TIMESTAMP "

) comment " 城区表";

-- 商圈表
drop table if exists ods_house_zoning_bizcircle_da;
create table if not exists ods_house_zoning_bizcircle_da 
(
     id bigint comment "主键"
    ,name string comment "名称,默认值为:''"
    ,circle_keywords string comment "关键字,默认值为:''"
    ,brief string comment "简介,默认值为:''"
    ,full_spell string comment "全拼,默认值为:''"
    ,state bigint comment "状态：0，新建1，有效2，无效,默认值为:0"
    ,city_id bigint comment "城市编号,默认值为:0"
    ,cuser bigint comment "新建人编号,默认值为:0"
    ,ctime string comment "新建时间,默认值为:1000-01-01 00:00:00"
    ,muser bigint comment "修改人编号,默认值为:0"
    ,mtime string comment "修改时间,默认值为:CURRENT_TIMESTAMP"
) comment "商圈表";


drop table if exists ods_housedel_basic_info_da;
create table ods_housedel_basic_info_da
(
     housedel_id bigint comment "业务系统物理主键"
    ,house_id bigint comment "房屋主键 来源楼盘字典"
    ,state bigint comment "房源状态 1:有效,2:意向金,3:定金,4:起草合同,5:合同盖章,6:合同签约,7:过户,8:掉入资源池,9:无效"
    ,owner_name string comment "业主姓名"
    ,owner_phone_a string comment "业主手机号A"
    ,total_price double comment "挂牌价格 单位：元"
    ,bedroom_cnt bigint comment "室 -1:未知"
    ,parlor_cnt bigint comment "厅 -1:未知"
    ,cookroom_cnt bigint comment "厨 -1:未知"
    ,toilet_cnt bigint comment "卫 -1:未知"
    ,balcony_cnt bigint comment "阳台 -1:未知"
    ,build_area double comment "建筑面积 -1:未知"
    ,inside_area double comment "套内面积 -1:未知"
    ,frame_face string comment "户型朝向 1:东 2：南 3：西 4：北 5：东南 6：东北 7：西南 8：西北"
    ,stat_function bigint comment "房屋用途 -1:未知,1:车库,3:普通住宅,4:别墅,5:四合院,6:写字楼,7:商业,8:工业厂房,9:平房,10:商住两用,12:花园洋房,13:新式里弄,14:旧式里弄,15:老公寓"
    ,fitment_type bigint comment "装修情况 1:简装,2:毛坯,3:精装,-1:未知或不涉及"
    ,is_limit_buy bigint comment "是否限购 0 否；1 是 -1:未知或不涉及"
    ,is_share_property bigint comment "是否共有产权 0 否；1 是 -1:未知或不涉及"
    ,is_unique_house bigint comment "是否唯一房产 0 否；1 是 -1:未知或不涉及"
    ,mortgage_info bigint comment "抵押信息 1:有抵押,2:无抵押 -1:未知或不涉及"
    ,residence_status bigint comment "户口情况 1:有户口，可迁出,2:有户口，不可迁出,3:无户口，可迁入,4:无户口，不可迁入"
    ,deal_property bigint comment "交易权属 -1：代表未知或不涉及,1:商品房,2:已购公房,3:房改房,4:售后公房,5:公产房,6:使用权(企业产）,7:央产房,8:经济适用房,9:一类经济适用房,10:二类经济适用房,11:动迁安置房,12:两限房,13:地产房,14:使用权,15:乡产,16:私产,17:军产,18:拆迁还建房,19:集资房,20:自住型商品房"
    ,register_date string comment "房本登记日期 默认值为：1000-01-01 代表未知或不涉及"
    ,purchase_date string comment "原购房合同日期 默认值为：1000-01-01 代表未知或不涉及"
    ,contract_tax_date string comment "契税日期 默认值为：1000-01-01 代表未知或不涉及"
    ,rent_type bigint comment "租赁方式 1:整租,2:合租 -1:未知或不涉及"
    ,rent_dealline bigint comment "租期 1:短租（1~3个月）,2:长租 -1:未知或不涉及"
    ,rent_payment_type bigint comment "租赁付款方式 -1:未知或不涉及,1:月付,2:双月付,3:季付,4:半年付,5:年付"
    ,rent_facility string comment "租赁配套设施 1:床,2:电视,3:冰箱,4:洗衣机,5:空调,6:暖气,7:宽带,8:家具,9:天然气,10:热水器"
    ,house_status bigint comment "房屋现状 -1:未知或不涉及 1:自住,2:空闲,3:出租,4:经营中"
    ,del_source bigint comment "一级委托来源 1:营销活动,2:展会,3:社区活动,4:营销活动,5:实体开发,6:店面接待,7:社区开发,8:人际开发,9:转介绍,10:物业开发,11:保安开发"
    ,biz_type bigint comment "房源类型 1:买卖,2:出租"
    ,creator_ucid bigint comment "录入人编号"
    ,creator_name string comment "录入人姓名"
    ,creator_time string comment "录入时间"
    ,holder_ucid bigint comment "维护人编号"
    ,holder_name string comment "维护人姓名"
    ,holder_time string comment "维护时间"
    ,appro_ucid bigint comment "实堪人编号"
    ,appro_name string comment "实堪人姓名"
    ,appro_time string comment "实堪时间"
    ,key_ucid bigint comment "钥匙人编号"
    ,key_name string comment "钥匙人姓名"
    ,key_time string comment "钥匙时间"
    ,sign_ucid bigint comment "签约人编号"
    ,sign_name string comment "签约人姓名"
    ,sign_time string comment "签约时间"
    ,update_ucid bigint comment "修改人ucid"
    ,update_name string comment "修改人名称"
    ,update_time string comment "修改时间"
) comment "房源委托基础信息";


-- 房源证件信息
drop table if exists ods_housedel_credentials_da;
create table if not exists ods_housedel_credentials_da 
(
     id bigint comment "自增ID,默认值为:0" 
    ,housedel_id bigint comment "房源编号,默认值为:0"
    ,credential_type bigint comment "证件类型 1:业主房屋委托书 2：业主身份证 3：房产证 4: 契税证明"
    ,credential_path string comment "证件图片地址"
    ,creator_ucid bigint comment "证件上传人 默认值为0"
    ,auditor_ucid bigint comment "证件审核人 默认值为0"
    ,status bigint comment "0 上传 1 审核通过 2 审核没有通过"
    ,fail_reason string comment "审核失败原因 默认值为''"
    ,create_time string comment "创建时间-开始,默认值为:'1000-01-01 00:00:00'" 
    ,update_time string comment "更新时间-开始,默认值为:'1000-01-01 00:00:00'" 
) comment " 房源证件信息";




drop table if exists ods_housedel_kpi_info_da;
create table ods_housedel_kpi_info_da
(
     housedel_id bigint comment "房源ID"
    ,change_price_cnt bigint comment "总调价数"
    ,change_price_30_cnt bigint comment "近30天调价次数"
    ,change_up_price_cnt bigint comment "涨价次数"
    ,change_up_price_30_cnt bigint comment "近30天涨价次数"
    ,change_down_price_cnt bigint comment "涨价次数"
    ,change_down_price_30_cnt bigint comment "近30天涨价次数"
    ,first_change_price_time string comment "首次调价时间"
    ,last_change1_price_time string comment "最后一次调价时间"
    ,key_cnt bigint comment "钥匙使用总次数"
    ,key_30_cnt bigint comment "近30天钥匙使用次数"
    ,key_user_cnt bigint comment "钥匙使用总次数"
    ,key_user_30_cnt bigint comment "近30天钥匙使用次数"
    ,min_begin_time string comment "首次钥匙使用时间"
    ,max_begin1_time string comment "最近一次钥匙使用时间"
    ,showing_cnt bigint comment "带看总次数"
    ,showing_30_cnt bigint comment "近30天带看次数"
    ,showing_cust_cnt bigint comment "带看总客数"
    ,showing_30_cust_cnt bigint comment "近30天带看客数"
    ,showing_agent_cnt bigint comment "带看总经纪人数"
    ,showing_30_agent_cnt bigint comment "近30天带看经纪人数"
    ,accompany_cnt bigint comment "维护人陪看次数"
    ,feedback_type1_cnt bigint comment "有意向购买次数"
    ,feedback_type2_cnt bigint comment "再考虑看看次数"
    ,feedback_type3_cnt bigint comment "价格不满意次数"
    ,feedback_type4_cnt bigint comment "房子不满意次数"
    ,min_start_time string comment "首次带看时间"
    ,max_start1_time string comment "最近一次带看时间"
    ,view_cnt bigint comment "浏览总次数"
    ,view_30_cnt bigint comment "近30天浏览次数"
    ,view_cust_cnt bigint comment "浏览总客源数"
    ,view_30_cust_cnt bigint comment "近30天浏览总客源数"
    ,agent_comment_cnt bigint comment "经纪人房评总次数"
    ,commnet_agent_cnt bigint comment "评房经纪人数"
    ,agent_min_comment_time string comment "经纪人首次房评时间"
    ,agent_max_comment_time string comment "经纪人最近房评时间"
    ,owner_comment_cnt bigint comment "业主荐总次数"
    ,owner_min_comment_time string comment "业主首次自荐时间"
    ,owner_max_comment_time string comment "业主最后自荐时间"
) comment "房源行为关键指标统计";


-- 房源实勘、审核
drop table if exists ods_housedel_real_prospecting_da;
create table if not exists ods_housedel_real_prospecting_da 
(
      id bigint comment "实勘表主键id"
    ,housedel_id bigint comment "房源委托表主键ID,默认值为:0"
    ,file_type bigint comment "文件类型 1:室 2:厅 3:厨 4:卫"
    ,file_path string comment "实勘照片地址"
    ,broker_ucid bigint comment "实勘人,默认值为:0"
    ,broker_time string comment "成为实勘人时间,默认值为:'1000-01-01 00:00:00'"
    ,audit_ucid bigint comment "审核人ID,默认值为:0"
    ,audit_result bigint comment "审核结果 0：实勘不合格 1：实勘审核通过,默认值为:-1:待审核"
    ,create_time string comment "创建时间,默认值为:'1000-01-01 00:00:00'"
    ,update_time string comment "更新时间,默认值为:'1000-01-01 00:00:00'"
) comment "房源实勘、审核";


drop table if exists ods_house_basic_info_da;
create table ods_house_basic_info_da
(
     house_id bigint comment "房屋ID"
    ,house_name string comment "名称,默认值为:''"
    ,house_begin_floor bigint comment "起始层,默认值为:0"
    ,house_end_floor bigint comment "结束层,默认值为:0"
    ,house_gift_area double comment "赠送面积,默认值为:0"
    ,house_prop_num bigint comment "产权证数量,默认值为1"
    ,city_name string comment "城市名称"
    ,province_name string comment "省份名称"
    ,building_id bigint comment "楼栋ID"
    ,building_name string comment "楼栋号,默认值为:''"
    ,building_prop_addr string comment "产权地址,默认值为:''"
    ,building_check_in_date string comment "入住日期,默认值为:1000-01-01"
    ,building_build_year bigint comment "建成年代,默认值为:0"
    ,building_build_structure_name string comment "建筑结构,默认值为:0 1:混凝土结构 2:砌体结构 3:钢结构 4:轻型钢结构 5:其它"
    ,building_build_type_name string comment "建筑类型,默认值为:0 1:塔楼 2:板楼 3:板塔结合"
    ,building_is_separate_name string comment "电梯客货标识：0，未知1，是2，否,默认值为:0 "
    ,building_heating_type_name string comment "供暖类型(枚举),默认值为:0 1：集体供暖 2：自供暖"
    ,building_heating_fee double comment "供暖费用(元/采暖季/平方米),默认值为:0"
    ,building_electric_type_name string comment "用电类型(枚举),默认值为:0 1:民用电 2：商用电"
    ,building_water_type_name string comment "是否有暖气：0，未知1，是2，否,默认值为:0"
    ,building_is_gas_name string comment "是否有暖气：0，未知1，是2，否,默认值为:0"
    ,building_gas_fee double comment "燃气费(元/立方米),默认值为:0"
    ,building_tenement_fee double comment "物业费(元/月/平方米),默认值为:0"
    ,building_property_age_limit bigint comment "产权年限,默认值为:0"
    ,district_name string comment "城区名称"
    ,bizcircle_name string comment "商圈名称"
    ,resblock_id bigint comment "楼盘ID"
    ,resblock_name string comment "名称,默认值为:''"
    ,resblock_green_area double comment "绿化面积,默认值为:0"
    ,resblock_site_area double comment "占地面积,默认值为:0"
    ,resblock_build_area double comment "建筑面积,默认值为:0"
    ,resblock_open_date string comment "开盘日期,默认值为:1000-01-01 00:00:00"
    ,resblock_cycle_line_name string comment "环线位置,默认值为:0 1:1,2环 2:2~3环 3：3~4环 4：4~5环 5：5环及以外"
    ,resblock_car_up_cnt bigint comment "地上车位,默认值为:0"
    ,resblock_car_down_cnt bigint comment "地下车位,默认值为:0"
    ,unit_name string comment "单元号,默认值为:''"
    ,unit_elevator_cnt bigint comment "电梯数量,默认值为:0"
    ,unit_is_separate_name string comment "是否客货分离：0:未知1:是2:否,默认值为:0"
    ,unit_is_card_name string comment "有无门禁卡：0:未知1:有2:无,默认值为:0"
    ,floor_physical_floor bigint comment "物理楼层,默认值为:0"
    ,floor_signal_floor string comment "标号楼层,默认值为:''"
    ,floor_floor_height double comment "建筑层高,默认值为:0"
)comment "房屋基础信息";


drop table if exists ods_house_community_info_da;
create table ods_house_community_info_da
(
     resblock_id bigint comment "楼盘ID"
    ,community_info string comment "社区id&(一级社区|二级社区|未知)&名称"
)comment "楼盘对应社区信息";


drop table if exists ods_house_developer_info_da;
create table ods_house_developer_info_da
(
     resblock_id bigint comment "楼盘ID"
    ,developer_name string comment "名称,默认值为:''"
    ,developer_is_brand_name string comment "是否品牌名称"
    ,group_name string comment "名称,默认值为:''"
)comment "楼盘对应开发商信息";


drop table if exists ods_house_property_info_da;
create table ods_house_property_info_da
(
    resblock_id bigint comment "楼盘ID"
    ,property_office_tel string comment "办公电话,默认值为:''"
    ,property_office_addr string comment "l办公地址,默认值为:''"
    ,property_name string comment "名称,默认值为:''"
    ,property_group_name string comment "名称,默认值为:''"
)comment "楼盘对应物业信息"; ;



drop table  if exists ods_house_school_info_da;
create table ods_house_school_info_da
(
     building_id bigint comment "楼栋ID"
    ,school_id bigint comment "学校id,默认值为:0"
    ,school_name string comment "名称,默认值为:''"
    ,school_addr string comment "地址,默认值为:''"
    ,school_level_name string comment "学区分级,默认值为:0 1:重点 2：普通 3：其它"
    ,school_property_name string comment "学校性质,默认值为:0 1:私立市重点 2：私立区重点 3：公立市重点 4：公立区重点 5：私立普通 6：公立普通 7：其它"
)comment "楼栋对应学校信息";


drop table if exists ods_house_station_info_da;
create table ods_house_station_info_da
(
     building_id bigint comment "楼栋ID"
     ,station_info string comment "地铁站id&地铁站名称&直线距离&步行距离&步行距离值&步行时间&步行时间值&地铁线ID&地铁线名称"
)comment "楼栋对应地铁站信息";

drop table if exists dwa_housedel_housedel_all_info_da;
create table dwa_housedel_housedel_all_info_da
(
     housedel_id bigint comment "业务系统物理主键"
    ,house_id bigint comment "房屋主键 来源楼盘字典"
    ,state bigint comment "房源状态 1:有效,2:意向金,3:定金,4:起草合同,5:合同盖章,6:合同签约,7:过户,8:掉入资源池,9:无效"
    ,owner_name string comment "业主姓名"
    ,owner_phone_a string comment "业主手机号A"
    ,total_price double comment "挂牌价格 单位：元"
    ,bedroom_cnt bigint comment "室 -1:未知"
    ,parlor_cnt bigint comment "厅 -1:未知"
    ,cookroom_cnt bigint comment "厨 -1:未知"
    ,toilet_cnt bigint comment "卫 -1:未知"
    ,balcony_cnt bigint comment "阳台 -1:未知"
    ,build_area double comment "建筑面积 -1:未知"
    ,inside_area double comment "套内面积 -1:未知"
    ,frame_face string comment "户型朝向 1:东 2：南 3：西 4：北 5：东南 6：东北 7：西南 8：西北"
    ,stat_function bigint comment "房屋用途 -1:未知,1:车库,3:普通住宅,4:别墅,5:四合院,6:写字楼,7:商业,8:工业厂房,9:平房,10:商住两用,12:花园洋房,13:新式里弄,14:旧式里弄,15:老公寓"
    ,fitment_type bigint comment "装修情况 1:简装,2:毛坯,3:精装,-1:未知或不涉及"
    ,is_limit_buy bigint comment "是否限购 0 否；1 是 -1:未知或不涉及"
    ,is_share_property bigint comment "是否共有产权 0 否；1 是 -1:未知或不涉及"
    ,is_unique_house bigint comment "是否唯一房产 0 否；1 是 -1:未知或不涉及"
    ,mortgage_info bigint comment "抵押信息 1:有抵押,2:无抵押 -1:未知或不涉及"
    ,residence_status bigint comment "户口情况 1:有户口，可迁出,2:有户口，不可迁出,3:无户口，可迁入,4:无户口，不可迁入"
    ,deal_property bigint comment "交易权属 -1：代表未知或不涉及,1:商品房,2:已购公房,3:房改房,4:售后公房,5:公产房,6:使用权(企业产）,7:央产房,8:经济适用房,9:一类经济适用房,10:二类经济适用房,11:动迁安置房,12:两限房,13:地产房,14:使用权,15:乡产,16:私产,17:军产,18:拆迁还建房,19:集资房,20:自住型商品房"
    ,register_date string comment "房本登记日期 默认值为：1000-01-01 代表未知或不涉及"
    ,purchase_date string comment "原购房合同日期 默认值为：1000-01-01 代表未知或不涉及"
    ,contract_tax_date string comment "契税日期 默认值为：1000-01-01 代表未知或不涉及"
    ,rent_type bigint comment "租赁方式 1:整租,2:合租 -1:未知或不涉及"
    ,rent_dealline bigint comment "租期 1:短租（1~3个月）,2:长租 -1:未知或不涉及"
    ,rent_payment_type bigint comment "租赁付款方式 -1:未知或不涉及,1:月付,2:双月付,3:季付,4:半年付,5:年付"
    ,rent_facility string comment "租赁配套设施 1:床,2:电视,3:冰箱,4:洗衣机,5:空调,6:暖气,7:宽带,8:家具,9:天然气,10:热水器"
    ,house_status bigint comment "房屋现状 -1:未知或不涉及 1:自住,2:空闲,3:出租,4:经营中"
    ,del_source bigint comment "一级委托来源 1:营销活动,2:展会,3:社区活动,4:营销活动,5:实体开发,6:店面接待,7:社区开发,8:人际开发,9:转介绍,10:物业开发,11:保安开发"
    ,biz_type bigint comment "房源类型 1:买卖,2:出租"
    ,creator_ucid bigint comment "录入人编号"
    ,creator_name string comment "录入人姓名"
    ,creator_time string comment "录入时间"
    ,holder_ucid bigint comment "维护人编号"
    ,holder_name string comment "维护人姓名"
    ,holder_time string comment "维护时间"
    ,appro_ucid bigint comment "实堪人编号"
    ,appro_name string comment "实堪人姓名"
    ,appro_time string comment "实堪时间"
    ,key_ucid bigint comment "钥匙人编号"
    ,key_name string comment "钥匙人姓名"
    ,key_time string comment "钥匙时间"
    ,sign_ucid bigint comment "签约人编号"
    ,sign_name string comment "签约人姓名"
    ,sign_time string comment "签约时间"
    ,update_ucid bigint comment "修改人ucid"
    ,update_name string comment "修改人名称"
    ,update_time string comment "修改时间"


    ,del_credential_path string comment "房源委托书 证件图片地址"
    ,card_credential_path string comment "业主身份证 证件图片地址"
    ,hpc_credential_path string comment "房产证 证件图片地址"
    ,tax_credential_path string comment "契税证明 证件图片地址"

    ,housedel_pic_info string comment "房源实勘照片集合#分隔"

    ,change_price_cnt bigint comment "总调价数"
    ,change_price_30_cnt bigint comment "近30天调价次数"
    ,change_up_price_cnt bigint comment "涨价次数"
    ,change_up_price_30_cnt bigint comment "近30天涨价次数"
    ,change_down_price_cnt bigint comment "涨价次数"
    ,change_down_price_30_cnt bigint comment "近30天涨价次数"
    ,first_change_price_time string comment "首次调价时间"
    ,last_change1_price_time string comment "最后一次调价时间"
    ,key_cnt bigint comment "钥匙使用总次数"
    ,key_30_cnt bigint comment "近30天钥匙使用次数"
    ,key_user_cnt bigint comment "钥匙使用总次数"
    ,key_user_30_cnt bigint comment "近30天钥匙使用次数"
    ,min_begin_time string comment "首次钥匙使用时间"
    ,max_begin1_time string comment "最近一次钥匙使用时间"
    ,showing_cnt bigint comment "带看总次数"
    ,showing_30_cnt bigint comment "近30天带看次数"
    ,showing_cust_cnt bigint comment "带看总客数"
    ,showing_30_cust_cnt bigint comment "近30天带看客数"
    ,showing_agent_cnt bigint comment "带看总经纪人数"
    ,showing_30_agent_cnt bigint comment "近30天带看经纪人数"
    ,accompany_cnt bigint comment "维护人陪看次数"
    ,feedback_type1_cnt bigint comment "有意向购买次数"
    ,feedback_type2_cnt bigint comment "再考虑看看次数"
    ,feedback_type3_cnt bigint comment "价格不满意次数"
    ,feedback_type4_cnt bigint comment "房子不满意次数"
    ,min_start_time string comment "首次带看时间"
    ,max_start1_time string comment "最近一次带看时间"
    ,view_cnt bigint comment "浏览总次数"
    ,view_30_cnt bigint comment "近30天浏览次数"
    ,view_cust_cnt bigint comment "浏览总客源数"
    ,view_30_cust_cnt bigint comment "近30天浏览总客源数"
    ,agent_comment_cnt bigint comment "经纪人房评总次数"
    ,commnet_agent_cnt bigint comment "评房经纪人数"
    ,agent_min_comment_time string comment "经纪人首次房评时间"
    ,agent_max_comment_time string comment "经纪人最近房评时间"
    ,owner_comment_cnt bigint comment "业主荐总次数"
    ,owner_min_comment_time string comment "业主首次自荐时间"
    ,owner_max_comment_time string comment "业主最后自荐时间"

    ,house_name string comment "名称,默认值为:''"
    ,house_begin_floor bigint comment "起始层,默认值为:0"
    ,house_end_floor bigint comment "结束层,默认值为:0"
    ,house_gift_area double comment "赠送面积,默认值为:0"
    ,house_prop_num bigint comment "产权证数量,默认值为1"
    ,city_name string comment "城市名称"
    ,province_name string comment "省份名称"
    ,building_id bigint comment "楼栋ID"
    ,building_name string comment "楼栋号,默认值为:''"
    ,building_prop_addr string comment "产权地址,默认值为:''"
    ,building_check_in_date string comment "入住日期,默认值为:1000-01-01"
    ,building_build_year bigint comment "建成年代,默认值为:0"
    ,building_build_structure_name string comment "建筑结构,默认值为:0 1:混凝土结构 2:砌体结构 3:钢结构 4:轻型钢结构 5:其它"
    ,building_build_type_name string comment "建筑类型,默认值为:0 1:塔楼 2:板楼 3:板塔结合"
    ,building_is_separate_name string comment "电梯客货标识：0，未知1，是2，否,默认值为:0 "
    ,building_heating_type_name string comment "供暖类型(枚举),默认值为:0 1：集体供暖 2：自供暖"
    ,building_heating_fee double comment "供暖费用(元/采暖季/平方米),默认值为:0"
    ,building_electric_type_name string comment "用电类型(枚举),默认值为:0 1:民用电 2：商用电"
    ,building_water_type_name string comment "是否有暖气：0，未知1，是2，否,默认值为:0"
    ,building_is_gas_name string comment "是否有暖气：0，未知1，是2，否,默认值为:0"
    ,building_gas_fee double comment "燃气费(元/立方米),默认值为:0"
    ,building_tenement_fee double comment "物业费(元/月/平方米),默认值为:0"
    ,building_property_age_limit bigint comment "产权年限,默认值为:0"
    ,district_name string comment "城区名称"
    ,bizcircle_name string comment "商圈名称"
    ,resblock_id bigint comment "楼盘ID"
    ,resblock_name string comment "名称,默认值为:''"
    ,resblock_green_area double comment "绿化面积,默认值为:0"
    ,resblock_site_area double comment "占地面积,默认值为:0"
    ,resblock_build_area double comment "建筑面积,默认值为:0"
    ,resblock_open_date string comment "开盘日期,默认值为:1000-01-01 00:00:00"
    ,resblock_cycle_line_name string comment "环线位置,默认值为:0 1:1,2环 2:2~3环 3：3~4环 4：4~5环 5：5环及以外"
    ,resblock_car_up_cnt bigint comment "地上车位,默认值为:0"
    ,resblock_car_down_cnt bigint comment "地下车位,默认值为:0"
    ,unit_name string comment "单元号,默认值为:''"
    ,unit_elevator_cnt bigint comment "电梯数量,默认值为:0"
    ,unit_is_separate_name string comment "是否客货分离：0:未知1:是2:否,默认值为:0"
    ,unit_is_card_name string comment "有无门禁卡：0:未知1:有2:无,默认值为:0"
    ,floor_physical_floor bigint comment "物理楼层,默认值为:0"
    ,floor_signal_floor string comment "标号楼层,默认值为:''"
    ,floor_floor_height double comment "建筑层高,默认值为:0"


    ,developer_name string comment "名称,默认值为:''"
    ,developer_is_brand_name string comment "是否品牌名称"
    ,group_name string comment "名称,默认值为:''"

    ,property_office_tel string comment "办公电话,默认值为:''"
    ,property_office_addr string comment "l办公地址,默认值为:''"
    ,property_name string comment "名称,默认值为:''"
    ,property_group_name string comment "名称,默认值为:''"

    ,school_id bigint comment "学校id,默认值为:0"
    ,school_name string comment "名称,默认值为:''"
    ,school_addr string comment "地址,默认值为:''"
    ,school_level_name string comment "学区分级,默认值为:0 1:重点 2：普通 3：其它"
    ,school_property_name string comment "学校性质,默认值为:0 1:私立市重点 2：私立区重点 3：公立市重点 4：公立区重点 5：私立普通 6：公立普通 7：其它"


    ,community_info string comment "社区id&(一级社区|二级社区|未知)&名称"

    ,station_info string comment "地铁站id&地铁站名称&直线距离&步行距离&步行距离值&步行时间&步行时间值&地铁线ID&地铁线名称"
 );

