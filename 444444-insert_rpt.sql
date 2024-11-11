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