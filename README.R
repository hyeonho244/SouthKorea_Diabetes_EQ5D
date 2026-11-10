library(foreign)

setwd('D:\\Downloads\\KHP+2024_spss') #한국의료패널데이터 2024년도 자료임
F_IND <- read.spss("F_IND.SAV")
F_MS <- read.spss('F_MS.SAV')

F_IND <- data.frame(F_IND)
F_MS <- data.frame(F_MS)


panel <- merge(F_IND, F_MS, by = 'PIDWON')
panel_table <- filter(panel, !is.na(HS_EQ2))
panel_table_refined <- select(panel_table, PIDWON, CD1_DM, MA1, HS_EQ1 ,HS_EQ2, HS_EQ3, HS_EQ4, HS_EQ5)


panel_table_refined_당뇨 <- filter(panel_table_refined, CD1_DM == 1, MA1 == 1 | MA1 == 4)

panel_table_refined_당뇨
colnames(panel_table_refined_당뇨) <- c('PIDWON', 'CD1_DM', 'MA1', 'MO', 'SC', 'UA', 'PD', 'AD')



library(eq5d)

mean(eq5d(panel_table_refined_당뇨, country = 'SouthKorea', version = '3L', type = 'TTO'))
# type에서 TTO는 시간교환법, VAS는 아날로그법이다.
# version에서 3L은 각 항목의 범위가 1-3. 5L은 1-5이다.


eq5d(scores=c(MO=test_table2$EQ1, SC=test_table2$EQ2, UA=test_table2$EQ3 , PD=test_table2$EQ4, AD=test_table2$EQ5),
     type='TTO', country = 'SouthKorea', version='3L')



