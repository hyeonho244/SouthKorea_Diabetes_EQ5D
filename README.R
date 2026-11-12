library(foreign)
library(dplyr)
setwd('D:\\OneDrive\\Desktop\\보건의료경제성평가 팀플')

HN <- read.spss('HN24_ALL(SPSS)\\HN24_ALL.sav')
HN <- as.data.frame(HN)


HN <- select(HN, ID, age, HE_DM_HbA1c, DE1_pr, DE1_ag, HE_glu, DE1_31, EQ5D, HE_Uket) #표본: 전체(6997명)

HN_TDM <- filter(HN, DE1_pr == 1, DE1_31 == 1)

# 논의: 케톤산증을 가진 표본은 어떻게 찾을 것인가? => 케톤산증 유무 변수 x
# 케톤산증 진단 기준: https://www.metrohosp.com/sub05/healthguide_contents.php?idx=8700 / 이 중에서 데이터에 있는 변수만 뽑기
# 임상자료: BUN(혈액요소질소) = 43.86(+- 36.17)
# 문헌: '단일 기관에서 경험한 당뇨병성 케톤산증의 임상적 고찰'



HN_TDM_noevent <- filter(HN_TDM, 70 <= HE_glu)

HN_TDM_noevent <- filter(HN_TDM_noevent, !is.na(EQ5D))

mean(HN_TDM_noevent$EQ5D)
mean(HN_TDM_keto$EQ5D)
