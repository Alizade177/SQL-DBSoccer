use SOCCER_DB

--2 AVRO kuboku 2016-nın final matçının harada keçirildiyini öyrənmək üçün SQL sorğusu yazın. 
-- Yerin adı və şəhəri qaytarın. İstifadə ediləcək cədvəllər : soccer_venue, soccer_city,  match_mast
select 
S.venue_name,
C.city 
from 
soccer_venue as S
JOIN soccer_city as C
ON
S.city_id=C.city_id
JOIN match_mast as M
On
M.venue_id=S.venue_id
and M.play_stage='F'

--3 Aşağıdakı cədvəllərdən normal oyun zamanı hər bir komandanın hər matçda vurduğu qolların sayını tapmaq üçün SQL sorğusu yazın. 
-- Matç nömrəsini, ölkə adını və qol hesabını qaytarın.  İstifadə ediləcək cədvəllər : match_details, soccer_country

select 
M.match_no,
S.country_name,
M.goal_score 
from 
match_details as M
Join [Soccer Country] as S
On 
M.team_id=S.country_id
order by
match_no;

-- 4 Hər bir ölkənin aldığı sarı kartların sayını hesablayan SQL sorğusu yazın. Ölkənin adını və sarı vərəqələrin sayını qaytarın.
-- Əgər heç bir sarı kart alan yoxdursa null gəlsin. İstifadə ediləcək cədvəllər : soccer_country, player_booked

select 
Count(*) as y_card_count,
S.country_name
from 
[Soccer Country] as S
Join player_booked  as P
On
S.country_id=P.team_id
group by S.country_name


-- 5  Kubok uğrunda oyunlarda kimin ən çox qol vurduğunu öyrənmək üçün SQL sorğusu yazın. 
-- Oyunçu adını, ölkə adını və ən yüksək fərdi qol vuran oyunçunu qaytarın.
--İstifadə ediləcək cədvəllər : goal_details, soccer_country, player_mast

select 
P.player_name ,
S.country_name,
Count(P.player_name) as goal
from 
goal_details as G
JOIN player_mast as P
on 
G.player_id=P.player_id
Join[Soccer Country]  as S 
on 
P.team_id=S.country_id
group by 
P.player_name,
S.country_name

--6  2016-cı il Avrokubokunun finalında kimin qol vurduğunu öyrənmək üçün aşağıdakı cədvəldən SQL sorğusu yazın. 
-- Oyunçu adını, formanın nömrəsini və ölkə adını qaytarın. 
-- İstifadə ediləcək cədvəllər : goal_details, soccer_country, player_mast

select 
P.player_name,
P.jersey_no,
S.country_name  
from 
goal_details as G
JOIN [Soccer Country] as S
ON
G.team_id=S.country_id
JOIN player_mast as P
ON 
G.player_id = P.player_id
where play_stage ='F';


--7 Açılış matçını idarə edən hakimi tapmaq üçün SQL sorğusu yazın. 
-- Hakim adını, ölkə adını qaytarın. İstifadə ediləcək cədvəllər : referee_mast, soccer_country, match_mast

select 
R.referee_name,
S.country_name 
from 
match_mast as M
JOIN [Soccer Country] as S
ON
M.referee_id=S.country_id
JOIN referee_mast as R
ON
M.referee_id=R.referee_id
where M.match_no='1';


--8 AVRO kuboku 2016-nın açılış matçının keçirildiyi şəhəri tapmaq üçün SQL sorğusu yazın. 
-- Yerin adı, şəhəri qaytarın. İstifadə ediləcək cədvəllər : soccer_venue, soccer_city, match_mast

select 
S.venue_name,
SC.city 
from 
soccer_venue as S
JOIN match_mast as M
On
S.venue_id=M.venue_id
JOIN Soccer_city as SC
On 
S.city_id=SC.city_id
where match_no='1'

