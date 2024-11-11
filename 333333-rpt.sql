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

