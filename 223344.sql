truncate table dwa_housedel_housedel_all_info_da;
insert overwrite table dwa_housedel_housedel_all_info_da
select
     t01.housedel_id -- 业务系统物理主键
    ,t01.house_id -- 房屋主键 来源楼盘字典
    ,t01.state -- 房源状态 1:有效,2:意向金,3:定金,4:起草合同,5:合同盖章,6:合同签约,7:过户,8:掉入资源池,9:无效
    ,t01.owner_name -- 业主姓名
    ,t01.owner_phone_a -- 业主手机号A
    ,t01.total_price -- 挂牌价格 单位：元
    ,t01.bedroom_cnt -- 室 -1:未知
    ,t01.parlor_cnt -- 厅 -1:未知
    ,t01.cookroom_cnt -- 厨 -1:未知
    ,t01.toilet_cnt -- 卫 -1:未知
    ,t01.balcony_cnt -- 阳台 -1:未知
    ,t01.build_area -- 建筑面积 -1:未知
    ,t01.inside_area -- 套内面积 -1:未知
    ,t01.frame_face -- 户型朝向 1:东 2：南 3：西 4：北 5：东南 6：东北 7：西南 8：西北
    ,t01.stat_function -- 房屋用途 -1:未知,1:车库,3:普通住宅,4:别墅,5:四合院,6:写字楼,7:商业,8:工业厂房,9:平房,10:商住两用,12:花园洋房,13:新式里弄,14:旧式里弄,15:老公寓
    ,t01.fitment_type -- 装修情况 1:简装,2:毛坯,3:精装,-1:未知或不涉及
    ,t01.is_limit_buy -- 是否限购 0 否；1 是 -1:未知或不涉及
    ,t01.is_share_property -- 是否共有产权 0 否；1 是 -1:未知或不涉及
    ,t01.is_unique_house -- 是否唯一房产 0 否；1 是 -1:未知或不涉及
    ,t01.mortgage_info -- 抵押信息 1:有抵押,2:无抵押 -1:未知或不涉及
    ,t01.residence_status -- 户口情况 1:有户口，可迁出,2:有户口，不可迁出,3:无户口，可迁入,4:无户口，不可迁入
    ,t01.deal_property -- 交易权属 -1：代表未知或不涉及,1:商品房,2:已购公房,3:房改房,4:售后公房,5:公产房,6:使用权(企业产）,7:央产房,8:经济适用房,9:一类经济适用房,10:二类经济适用房,11:动迁安置房,12:两限房,13:地产房,14:使用权,15:乡产,16:私产,17:军产,18:拆迁还建房,19:集资房,20:自住型商品房
    ,t01.register_date -- 房本登记日期 默认值为：1000-01-01 代表未知或不涉及
    ,t01.purchase_date -- 原购房合同日期 默认值为：1000-01-01 代表未知或不涉及
    ,t01.contract_tax_date -- 契税日期 默认值为：1000-01-01 代表未知或不涉及
    ,t01.rent_type -- 租赁方式 1:整租,2:合租 -1:未知或不涉及
    ,t01.rent_dealline -- 租期 1:短租（1~3个月）,2:长租 -1:未知或不涉及
    ,t01.rent_payment_type -- 租赁付款方式 -1:未知或不涉及,1:月付,2:双月付,3:季付,4:半年付,5:年付
    ,t01.rent_facility -- 租赁配套设施 1:床,2:电视,3:冰箱,4:洗衣机,5:空调,6:暖气,7:宽带,8:家具,9:天然气,10:热水器
    ,t01.house_status -- 房屋现状 -1:未知或不涉及 1:自住,2:空闲,3:出租,4:经营中
    ,t01.del_source -- 一级委托来源 1:营销活动,2:展会,3:社区活动,4:营销活动,5:实体开发,6:店面接待,7:社区开发,8:人际开发,9:转介绍,10:物业开发,11:保安开发
    ,t01.biz_type -- 房源类型 1:买卖,2:出租
    ,t01.creator_ucid -- 录入人编号
    ,t01.creator_name -- 录入人姓名
    ,t01.creator_time -- 录入时间
    ,t01.holder_ucid -- 维护人编号
    ,t01.holder_name -- 维护人姓名
    ,t01.holder_time -- 维护时间
    ,t01.appro_ucid -- 实堪人编号
    ,t01.appro_name -- 实堪人姓名
    ,t01.appro_time -- 实堪时间
    ,t01.key_ucid -- 钥匙人编号
    ,t01.key_name -- 钥匙人姓名
    ,t01.key_time -- 钥匙时间
    ,t01.sign_ucid -- 签约人编号
    ,t01.sign_name -- 签约人姓名
    ,t01.sign_time -- 签约时间
    ,t01.update_ucid -- 修改人ucid
    ,t01.update_name -- 修改人名称
    ,t01.update_time -- 修改时间


    ,t02.del_credential_path -- 房源委托书 证件图片地址
    ,t02.card_credential_path -- 业主身份证 证件图片地址
    ,t02.hpc_credential_path -- 房产证 证件图片地址
    ,t02.tax_credential_path -- 契税证明 证件图片地址

    ,t03.housedel_pic_info -- 房源实勘照片集合#分隔

    ,t04.change_price_cnt -- 总调价数
    ,t04.change_price_30_cnt -- 近30天调价次数
    ,t04.change_up_price_cnt -- 涨价次数
    ,t04.change_up_price_30_cnt -- 近30天涨价次数
    ,t04.change_down_price_cnt -- 涨价次数
    ,t04.change_down_price_30_cnt -- 近30天涨价次数
    ,t04.first_change_price_time -- 首次调价时间
    ,t04.last_change1_price_time -- 最后一次调价时间
    ,t04.key_cnt -- 钥匙使用总次数
    ,t04.key_30_cnt -- 近30天钥匙使用次数
    ,t04.key_user_cnt -- 钥匙使用总次数
    ,t04.key_user_30_cnt -- 近30天钥匙使用次数
    ,t04.min_begin_time -- 首次钥匙使用时间
    ,t04.max_begin1_time -- 最近一次钥匙使用时间
    ,t04.showing_cnt -- 带看总次数
    ,t04.showing_30_cnt -- 近30天带看次数
    ,t04.showing_cust_cnt -- 带看总客数
    ,t04.showing_30_cust_cnt -- 近30天带看客数
    ,t04.showing_agent_cnt -- 带看总经纪人数
    ,t04.showing_30_agent_cnt -- 近30天带看经纪人数
    ,t04.accompany_cnt -- 维护人陪看次数
    ,t04.feedback_type1_cnt -- 有意向购买次数
    ,t04.feedback_type2_cnt -- 再考虑看看次数
    ,t04.feedback_type3_cnt -- 价格不满意次数
    ,t04.feedback_type4_cnt -- 房子不满意次数
    ,t04.min_start_time -- 首次带看时间
    ,t04.max_start1_time -- 最近一次带看时间
    ,t04.view_cnt -- 浏览总次数
    ,t04.view_30_cnt -- 近30天浏览次数
    ,t04.view_cust_cnt -- 浏览总客源数
    ,t04.view_30_cust_cnt -- 近30天浏览总客源数
    ,t04.agent_comment_cnt -- 经纪人房评总次数
    ,t04.commnet_agent_cnt -- 评房经纪人数
    ,t04.agent_min_comment_time -- 经纪人首次房评时间
    ,t04.agent_max_comment_time -- 经纪人最近房评时间
    ,t04.owner_comment_cnt -- 业主荐总次数
    ,t04.owner_min_comment_time -- 业主首次自荐时间
    ,t04.owner_max_comment_time -- 业主最后自荐时间

    ,t05.house_name -- 名称,默认值为:''
    ,t05.house_begin_floor -- 起始层,默认值为:0
    ,t05.house_end_floor -- 结束层,默认值为:0
    ,t05.house_gift_area -- 赠送面积,默认值为:0
    ,t05.house_prop_num -- 产权证数量,默认值为1
    ,t05.city_name -- 城市名称
    ,t05.province_name -- 省份名称
    ,t05.building_id -- 楼栋ID
    ,t05.building_name -- 楼栋号,默认值为:''
    ,t05.building_prop_addr -- 产权地址,默认值为:''
    ,t05.building_check_in_date -- 入住日期,默认值为:1000-01-01
    ,t05.building_build_year -- 建成年代,默认值为:0
    ,t05.building_build_structure_name -- 建筑结构,默认值为:0 1:混凝土结构 2:砌体结构 3:钢结构 4:轻型钢结构 5:其它
    ,t05.building_build_type_name -- 建筑类型,默认值为:0 1:塔楼 2:板楼 3:板塔结合
    ,t05.building_is_separate_name -- 电梯客货标识：0，未知1，是2，否,默认值为:0
    ,t05.building_heating_type_name -- 供暖类型(枚举),默认值为:0 1：集体供暖 2：自供暖
    ,t05.building_heating_fee -- 供暖费用(元/采暖季/平方米),默认值为:0
    ,t05.building_electric_type_name -- 用电类型(枚举),默认值为:0 1:民用电 2：商用电
    ,t05.building_water_type_name -- 是否有暖气：0，未知1，是2，否,默认值为:0
    ,t05.building_is_gas_name -- 是否有暖气：0，未知1，是2，否,默认值为:0
    ,t05.building_gas_fee -- 燃气费(元/立方米),默认值为:0
    ,t05.building_tenement_fee -- 物业费(元/月/平方米),默认值为:0
    ,t05.building_property_age_limit -- 产权年限,默认值为:0
    ,t05.district_name -- 城区名称
    ,t05.bizcircle_name -- 商圈名称
    ,t05.resblock_id -- 楼盘ID
    ,t05.resblock_name -- 名称,默认值为:''
    ,t05.resblock_green_area -- 绿化面积,默认值为:0
    ,t05.resblock_site_area -- 占地面积,默认值为:0
    ,t05.resblock_build_area -- 建筑面积,默认值为:0
    ,t05.resblock_open_date -- 开盘日期,默认值为:1000-01-01 00:00:00
    ,t05.resblock_cycle_line_name -- 环线位置,默认值为:0 1:1,2环 2:2~3环 3：3~4环 4：4~5环 5：5环及以外
    ,t05.resblock_car_up_cnt -- 地上车位,默认值为:0
    ,t05.resblock_car_down_cnt -- 地下车位,默认值为:0
    ,t05.unit_name -- 单元号,默认值为:''
    ,t05.unit_elevator_cnt -- 电梯数量,默认值为:0
    ,t05.unit_is_separate_name -- 是否客货分离：0:未知1:是2:否,默认值为:0
    ,t05.unit_is_card_name -- 有无门禁卡：0:未知1:有2:无,默认值为:0
    ,t05.floor_physical_floor -- 物理楼层,默认值为:0
    ,t05.floor_signal_floor -- 标号楼层,默认值为:''
    ,t05.floor_floor_height -- 建筑层高,默认值为:0


    ,t06.developer_name -- 名称,默认值为:''
    ,t06.developer_is_brand_name -- 是否品牌名称
    ,t06.group_name -- 名称,默认值为:''

    ,t07.property_office_tel -- 办公电话,默认值为:''
    ,t07.property_office_addr -- l办公地址,默认值为:''
    ,t07.property_name -- 名称,默认值为:''
    ,t07.property_group_name -- 名称,默认值为:''

    ,t08.school_id -- 学校id,默认值为:0
    ,t08.school_name -- 名称,默认值为:''
    ,t08.school_addr -- 地址,默认值为:''
    ,t08.school_level_name -- 学区分级,默认值为:0 1:重点 2：普通 3：其它
    ,t08.school_property_name -- 学校性质,默认值为:0 1:私立市重点 2：私立区重点 3：公立市重点 4：公立区重点 5：私立普通 6：公立普通 7：其它


    ,t09.community_info -- 社区id&(一级社区|二级社区|未知)&名称

    ,t10.station_info -- 地铁站id&地铁站名称&直线距离&步行距离&步行距离值&步行时间&步行时间值&地铁线ID&地铁线名称
from
(
    select *
    from ods_housedel_basic_info_da
) t01
left outer join
(
    select
         housedel_id -- 房源编号,默认值为:0
        ,max(case when credential_type=1 then credential_path else '' end) as del_credential_path -- 证件图片地址
        ,max(case when credential_type=2 then credential_path else '' end ) as card_credential_path  -- 证件图片地址
        ,max(case when credential_type=3 then credential_path else '' end ) as hpc_credential_path -- 证件图片地址
        ,max(case when credential_type=4 then credential_path else '' end ) as tax_credential_path  -- 证件图片地址
    from ods_housedel_credentials_da
    group by housedel_id
) t02 on t01.housedel_id = t02.housedel_id
left outer join
(
    select
        housedel_id
       ,wm_concat('#',file_path) as housedel_pic_info
    from ods_housedel_real_prospecting_da
    where audit_result=1 -- 审核通过
    group by housedel_id
) t03 on t01.housedel_id = t03.housedel_id
left outer join
(
    select *
    from ods_housedel_kpi_info_da
) t04 on t01.housedel_id = t04.housedel_id
left outer join
(
    select *
    from ods_house_basic_info_da
) t05 on t01.house_id = t05.house_id
left outer join
(
    select *
    from ods_house_developer_info_da
) t06 on t05.resblock_id = t06.resblock_id
left outer join
(
    select *
    from ods_house_property_info_da
) t07 on t05.resblock_id = t07.resblock_id
left outer join
(
    select *
    from ods_house_school_info_da
) t08 on t05.building_id = t08.building_id
left outer join
(
    select *
    from ods_house_community_info_da
) t09 on t05.resblock_id = t09.resblock_id
left outer join
(
    select *
    from ods_house_station_info_da
) t10 on t05.building_id = t10.building_id ;


drop table if exists rpt_housedel_holder_da;
create table rpt_housedel_holder_da
(
    holder_name string comment "维护人姓名"
   ,housedel_cnt bigint comment "维护房源量"
   ,housedel_valid_cnt bigint comment "维护有效房源量"
   ,housedel_contract_cnt bigint comment "维护房源的成交量"
);



drop table if exists rpt_housedel_creator_da;
create table rpt_housedel_creator_da
(
    creator_name string comment "录入人姓名"
   ,housedel_cnt bigint comment "录入房源量"
   ,housedel_valid_cnt bigint comment "录入有效房源量"
   ,housedel_contract_cnt bigint comment "录入房源的成交量"
);


drop table if exists rpt_housedel_district_da;
create table rpt_housedel_district_da
(
    district_name string comment "城区名称"
   ,housedel_cnt bigint comment "城区房源量"
   ,housedel_valid_cnt bigint comment "城区有效房源量"
   ,housedel_contract_cnt bigint comment "城区房源的成交量"
);


drop table if exists rpt_housedel_cycle_line_da;
create table rpt_housedel_cycle_line_da
(
    cycle_line_name string comment "环线名称"
   ,housedel_cnt bigint comment "环线房源量"
   ,housedel_valid_cnt bigint comment "环线有效房源量"
   ,housedel_contract_cnt bigint comment "环线房源的成交量"
);



drop table if exists rpt_housedel_create_month_da;
create table rpt_housedel_create_month_da
(
    create_month string comment "月份"
   ,housedel_cnt bigint comment "新增房源量"
);



drop table if exists rpt_housedel_source_da;
create table rpt_housedel_source_da
(
    source_name string comment "渠道名称"
   ,housedel_cnt bigint comment "新增房源量"
);



insert overwrite table rpt_housedel_holder_da
select
    holder_name
   ,count(distinct housedel_id) housedel_cnt
   ,count(distinct case when state=1 then housedel_id end) housedel_valid_cnt
   ,count(distinct case when state not in (1,9) then housedel_id end) housedel_contract_cnt
from dwa_housedel_housedel_all_info_da
group by holder_name;



insert overwrite table rpt_housedel_creator_da
select
    creator_name
   ,count(distinct housedel_id) as housedel_cnt
   ,count(distinct case when state=1 then housedel_id end) as housedel_valid_cnt
   ,count(distinct case when state not in (1,9) then housedel_id end) as housedel_contract_cnt
from dwa_housedel_housedel_all_info_da
group by creator_name;


insert overwrite  table rpt_housedel_district_da
select
    district_name
   ,count(distinct housedel_id) as housedel_cnt
   ,count(distinct case when state=1 then housedel_id end) as housedel_valid_cnt
   ,count(distinct case when state not in (1,9) then housedel_id end) as housedel_contract_cnt
from dwa_housedel_housedel_all_info_da
group by district_name;


insert overwrite table rpt_housedel_cycle_line_da
select
    resblock_cycle_line_name
   ,count(distinct housedel_id) as housedel_cnt
   ,count(distinct case when state=1 then housedel_id end) as housedel_valid_cnt
   ,count(distinct case when state not in (1,9) then housedel_id end) as housedel_contract_cnt
from dwa_housedel_housedel_all_info_da
group by resblock_cycle_line_name;

insert overwrite table rpt_housedel_create_month_da
select
    substr(creator_time,1,7) create_month
   ,count(distinct housedel_id) housedel_cnt
from dwa_housedel_housedel_all_info_da
group by substr(creator_time,1,7);

insert overwrite table rpt_housedel_source_da
select
    case when del_source=1 then '营销活动'
         when del_source=2 then '展会'
         when del_source=3 then '社区活动'
         when del_source=4 then '营销活动'
         when del_source=5 then '实体开发'
         when del_source=6 then '店面接待'
         when del_source=7 then '社区开发'
         when del_source=8 then '人际开发'
         when del_source=9 then '转介绍'
         when del_source=10 then '物业开发'
         when del_source=11 then '保安开发'
    end
   ,count(distinct housedel_id)
from dwa_housedel_housedel_all_info_da
group by
    case when del_source=1 then '营销活动'
         when del_source=2 then '展会'
         when del_source=3 then '社区活动'
         when del_source=4 then '营销活动'
         when del_source=5 then '实体开发'
         when del_source=6 then '店面接待'
         when del_source=7 then '社区开发'
         when del_source=8 then '人际开发'
         when del_source=9 then '转介绍'
         when del_source=10 then '物业开发'
         when del_source=11 then '保安开发'
    end;


    