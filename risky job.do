//Risky Jobs Census
//43 years
cd "D:\User_Data\Desktop\kan-2\industrial_census\"
import delimited "risky_jobs - 43y.csv", encoding("utf-8") clear
drop if 縣市=="陽明山管理局" | 縣市=="台北市區"
gen year=43
rename mingingm minging_company
replace minging_company=0 if missing(minging_company)
drop mingingf
gen mingingm=round((minging_company/428)*46065) //46065 is the total amount of male minging workers
gen mingingf=round((minging_company/428)*9531) //9531 is the total amount of male minging workers
replace huntingm=0 if missing(huntingm)
replace huntingf=0 if missing(huntingf)

gen total_employee_m= agriculturem+fishingm+forestorym+huntingm+mingingm+constructionm+cartransportationm+boattransportationm+transportationservicem+warehousingm+total_manufacturingm+utilitiesm+gasm+waterm+merchantm+otherm
gen total_employee_f= agriculturef+fishingf+forestoryf+huntingf+mingingf+constructionf+cartransportationf+boattransportationf+transportationservicef+warehousingf+total_manufacturingf+utilitiesf+gasm+waterf+merchantf+otherf
//drop if missing(agriculturem)
save risky_jobs_43y,replace
/*reference:
Agriculture: REPORT OF THE 1956 SAMPLE SAMPLE CENSUS OF AGRICULTURE
Note: Fishing Forestry Transportation are derived from Industrial Censusm, but the report already declared that the numbers could be inaccurate
Estimation:
Minging: (minging company/428)*46065
minging company is recorded cities by cities, then divided by 428(total companies in Taiwan) it will get a ratio representing how large the minging companies in one city compared to Taiwan, then x total male minging employee

*/

//50 years
/*import delimited "risky_jobs - 50y.csv", encoding("utf-8") clear
replace huntingm=0 if missing(huntingm)
replace huntingf=0 if missing(huntingf)
replace fishingm=0 if missing(fishingm)
replace fishingf=0 if missing(fishingf)
replace forestoryM=0 if missing(forestoryM)
replace forestoryf=0 if missing(forestoryf)
save risky_jobs_50y,replace
*/
/*
Reference:
Agriculture resoure 國家圖書館: https://twinfo.ncl.edu.tw/sgp/hypage.cgi?hyqstr=aiknpggfcecflgkibfefihgeqiejgheidjehldqkehihckdhghjiqhphkkeihdpjjidhifhiggqjkhheogheeedgcegecghefebgdedeggkejeifhhhifjfgshkjfeqedgddjieiqhjhnjchkeogcdjidiqhjhnjchkeoikdjhigodjhhkdhshoiqhrhqgoeeebfhiegqjmhiikgopljiolpkjcnepkknlcplmpodpjlgnopjkknppjkqngpilbocpikclldjiciqhjhkjghphfgoihhkfhiegqkfilifgceqdhkcgsifkjihedgodjiciqihijkfegeofhiegqjhhmhgjnhhecgodjiciqhjhkjghphfgdeqdhkcgshhjkhihnjfegeofhhihcjehlibjchkhggoeeebfhighqkdihgqjdimeokbhhdhkehsidkfgshqkdhhhgkdeqeb

Note:
Fishing: no 50y data
Forestory : no 50y data
Hunting: no 50y data
*/

//55years
import delimited "risky_jobs - 55y.csv", encoding("utf-8") clear
drop if 縣市=="陽明山管理局" | 縣市=="台北市區"
gen year=55
rename cartransportationm car_amount
rename cartransportationf car_capacity
rename boattransportationm boat_amount
rename boattransportationf boat_capacity
rename warehousingm warehouse_amount
rename warehousingf warehouse_capacity
//rename totalindustcensusm totalindust_employee
//drop totalindustcensusf

replace agriculturem=agriculturem*20 // 5% sample x20times 
replace agriculturef=agriculturef*20
replace huntingm=0 if missing(huntingm)
replace huntingf=0 if missing(huntingf)
replace mingingm=0 if missing(mingingm)
replace mingingf=0 if missing(mingingf)
replace forestorym=0 if missing(forestorym)
replace forestoryf=0 if missing(forestoryf)
replace railtransportationm=0 if missing(railtransportationm)
replace railtransportationf=0 if missing(railtransportationf)
replace car_amount=0 if missing(car_amount)
replace car_capacity=0 if missing(car_capacity)
replace boat_amount=0 if missing(boat_amount)
replace boat_capacity=0 if missing(boat_capacity)
replace transportationservicem=0 if missing(transportationservicem)
replace transportationservicef=0 if missing(transportationservicef)
replace othertransportationm=0 if missing(othertransportationm)
replace othertransportationf=0 if missing(othertransportationf)
replace warehouse_amount=0 if missing(warehouse_amount)
replace warehouse_capacity=0 if missing(warehouse_capacity)


replace airtransportationm=0 if missing(airtransportationm)
replace airtransportationf=0 if missing(airtransportationf)

gen cartransportationm=round((car_capacity/218854)*(11813+26844)) //total male employee in car transportation distributed by car capacity of city
gen cartransportationf=round((car_capacity/218854)*(8510+936)) //total female employee in car transportation distributed by car capacity of city
gen boattransportationm=round((boat_capacity/1365634)*(7239)) //total male employee in boat transportation distributed by car capacity of city
gen boattransportationf=round((boat_capacity/1365634)*(243)) //total male employee in boat transportation distributed by car capacity of city
gen warehousingm=round((warehouse_capacity/1119179)*(1292))
gen warehousingf=round((warehouse_capacity/1119179)*(168)) // total female employee in warehouse distributed by warehouse space of city

gen total_employee_m= agriculturem+fishingm+forestorym+aquaculturem+huntingm+mingingm+constructionm+airtransportationm+cartransportationm+boattransportationm+transportationservicem+othertransportationm+warehousingm+total_manufacturingm+utilitiesm+merchantm+otherm
gen total_employee_f= agriculturef+fishingf+forestoryf+aquaculturef+huntingf+mingingf+constructionf+airtransportationf+cartransportationf+boattransportationf+transportationservicef+othertransportationf+warehousingf+total_manufacturingf+utilitiesf+merchantf+otherf

save risky_jobs_55y,replace
/*
Estimation: 

cartransportationm=(total bus+truck capacity in one city)/(bus+truck capacity of whole Taiwan), it will get a ratio of capacity in one city compared to capacity of whole Taiwan . Multiplying this ratio to total male 11813+26844 is the truck logisitic employee+ tour bus employee. Same logic applied to boat transportation
warehousem=(total bus+truck capacity in one city)/(bus+truck capacity of whole Taiwan), it will get a ratio of capacity in one city compared to capacity of whole Taiwan . Multiplying this ratio to total male
warehouse employee. Same logic applied to warehouse female employee

*/


/*
Reference:
Agriculture: REPORT ON THE 1966 CENSUS OF AGRICULTURE TAIWAN, REPUBLIC OF CHINA
Fishing resource:  國家圖書館 https://twinfo.ncl.edu.tw/sgp/hypage.cgi?HYPAGE=search/detail.hpg&dtd_id=22&g=&sysid=00001113&sflag=1 page 246

*/
//65years
import delimited "risky_jobs - 65y.csv", encoding("utf-8") clear
gen year=65
rename fishingm fishing_total
rename aquaculturem aquaculture_total
drop fishingf
drop aquaculturef

replace huntingm=0 if missing(huntingm)
replace huntingf=0 if missing(huntingf)
gen fishingm=round(fishing_total*((77637+41768+101821)/(147983+79223+191501))) //total male employee in fishing distributed by total "employee(male+female)" of city
gen fishingf=round(fishing_total*((70346+37455+89680)/(147983+79223+191501)))
gen aquaculturem=round(aquaculture_total*(23933+988+618)/(37196+1337+669)) // total male employee in aquaculture distributed by total "employee (male+female)" of city
gen aquaculturef=round(aquaculture_total*(13263+349+51)/(37196+1337+669))


replace forestorym=0 if missing(forestorym)
replace forestoryf=0 if missing(forestoryf)
replace othertransportationm=0 if missing(othertransportationm)
replace othertransportationf=0 if missing(othertransportationf)

replace total_employee_m=total_employee_m+agriculturem+fishingm+forestorym+huntingm+mingingm+aquaculturem
replace total_employee_f=total_employee_f+agriculturef+fishingf+forestoryf+huntingf+mingingf+aquaculturef



save risky_jobs_65y,replace
use risky_jobs_43y,clear
append using risky_jobs_55y
append using risky_jobs_65y
replace airtransportationm=0 if missing(airtransportationm)
replace airtransportationf=0 if missing(airtransportationf)
replace railtransportationm=0 if missing(railtransportationm)
replace railtransportationf=0 if missing(railtransportationf)

gen transportationm=cartransportationm+boattransportationm+railtransportationm+airtransportationm+transportationservicem+othertransportationm
gen transportationf=cartransportationf+boattransportationf+railtransportationf+airtransportationf+transportationservicef+othertransportationf
replace aquaculturem=0 if missing(aquaculturem)
replace aquaculturef=0 if missing(aquaculturef)
drop cartransportationm boattransportationm railtransportationm airtransportationm transportationservicem
drop cartransportationf boattransportationf railtransportationf airtransportationf transportationservicef
rename 縣市 county
keep county year *m *f
drop gas* water* merchant* other* utilities* total_manufact*
rename mingingm miningm
rename mingingf miningf
drop hunting*
rename forestorym forestrym
rename forestoryf forestryf
save risky_jobs_append,replace

/*
fishingm: we have total fishing employee in one city then multilplying by gender ratio of whole taiwan
fishingf: same logic applied
aquaculture: same logic applied






