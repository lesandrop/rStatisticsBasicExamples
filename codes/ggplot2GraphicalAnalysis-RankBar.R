
#DOI:  https://doi.org/10.5753/sbsc.2017.9958

library(plyr)
library(ggplot2)
options(scipen=999)

plotTypeAnalysis <- function(ndf, label, fileName){

    #Gera os gráficos por tipo de robô.

    p <- ggplot(ndf, aes(x=Type, y=x, fill=Type)) + 
     geom_bar(stat="identity") +
     theme_bw(base_size = 14) +
     scale_fill_brewer(type = "qual") +
     xlab("Tipo de robô") + ylab(label) +
     theme(legend.position="none")

    pdf(fileName, width = 6, height = 4)
    print(p)
    dev.off()
}

typeAnaysis <- function(df){

    #Organiza o processamento dos dados por tipo de robô.

    print(aggregate(df$Atividade, by=list(Type=df$Tipo), length))
    ndf <- aggregate(df$Atividade, by=list(Type=df$Tipo), median)
    plotTypeAnalysis(ndf, "Atividade", "AtividadeT.pdf")

    ndf <- aggregate(df$Popularidade, by=list(Type=df$Tipo), median)
    plotTypeAnalysis(ndf, "Popularidade", "PopularidadeT.pdf")

    ndf <- aggregate(df$Visibilidade, by=list(Type=df$Tipo), median)
    plotTypeAnalysis(ndf, "Visibilidade", "VisibilidadeT.pdf")
}

imageActivity <- function(df){

    #Gera o gráfico de atividade por robô.

    df <- arrange(df,desc(Atividade))
    df$Robo <- factor(df$Robo, levels=df$Robo)

    avg <- round(mean(df$Atividade),2)
    avgTextPosition <- avg+75
    med <- round(median(df$Atividade),2)
    medTextPosition <- med+75

    p <- ggplot(df, aes(x=Robo, y=Atividade, fill="Atividade")) +
         scale_fill_manual(breaks = c("Atividade"), values = c("darkseagreen4"))+
         geom_bar(stat="identity") + theme_bw(base_size = 15) +
         geom_hline(aes(yintercept=avg), color="indianred4", size=1) +
         annotate("text", y = avgTextPosition, x = 20, label = paste("Média =",avg),color="indianred4") +
         geom_hline(aes(yintercept=med), color="goldenrod3", size=1) +
         annotate("text", y = medTextPosition, x = 20, label = paste("Mediana =",med),color="goldenrod3")+
         theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
         xlab("Ranque de robôs pelo valor de atividade") +
         theme(legend.position=c(0.8, 0.8), 
              legend.title=element_blank(),
              legend.key = element_rect(colour = NULL, fill = NULL),
              legend.background = element_rect(fill=alpha('blue', 0)))

    pdf("AtividadeR.pdf", width = 10, height = 5)
    print(p)
    dev.off()
}

imagePopularity <- function(df){

    #Gera o gráfico de popularidade por robô.

    df <- arrange(df,desc(Popularidade))
    df$Robo <- factor(df$Robo, levels=df$Robo)

    avg <- round(mean(df$Popularidade),2)
    avgTextPosition <- avg+14000
    med <- round(median(df$Popularidade),2)
    medTextPosition <- med+14000

    p <- ggplot(df, aes(x=Robo, y=Popularidade, fill="Popularidade")) +
         scale_fill_manual(breaks = c("Popularidade"),  values = c("steelblue4")) +
         geom_bar(stat="identity") + theme_bw(base_size = 15) +
         geom_hline(aes(yintercept=avg), color="indianred4", size=1) +
         annotate("text", y = avgTextPosition, x = 20, label = paste("Média =",avg),color="indianred4") +
         geom_hline(aes(yintercept=med), color="goldenrod3", size=1) +
         annotate("text", y = medTextPosition , x = 20, label = paste("Mediana =",med),color="goldenrod3") +
         theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
         xlab("Ranque de robôs pelo valor de popularidade") +
         theme(legend.position=c(0.8, 0.8),
               legend.title=element_blank(),
               legend.key = element_rect(colour = NULL, fill = NULL),
               legend.background = element_rect(fill=alpha('blue', 0)))

    pdf("PopularidadeR.pdf", width = 10, height = 5)
    print(p)
    dev.off()
}

imageVisibility <- function(df){

    #Gera o gráfico de visibilidade por robô.

    df <- arrange(df,desc(Visibilidade))
    df$Robo <- factor(df$Robo, levels=df$Robo)

    avg <- round(mean(df$Visibilidade),2)
    avgTextPosition <- avg+500
    med <- round(median(df$Visibilidade),2)
    medTextPosition <-  med+500

    p <- ggplot(df, aes(x=Robo, y=Visibilidade, fill="Visibilidade")) +
         scale_fill_manual(breaks = c("Visibilidade"),  values = c("burlywood4"))+
         geom_bar(stat="identity") + theme_bw(base_size = 15) +
         geom_hline(aes(yintercept=avg), color="indianred4", size=1) +
         annotate("text", y = avgTextPosition, x = 20, label = paste("Média =",avg),color="indianred4")+
         geom_hline(aes(yintercept=med), color="goldenrod3", size=1) +
         annotate("text", y = medTextPosition, x = 20, label = paste("Mediana =",med),color="goldenrod3")+
         theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
         xlab("Ranque de robôs pelo valor de visibilidade") +
         theme(legend.position=c(0.8, 0.8),
               legend.title=element_blank(),
               legend.key = element_rect(colour = NULL, fill = NULL),
               legend.background = element_rect(fill=alpha('blue', 0)))

    pdf("VisibilidadeR.pdf", width = 10, height = 5)
    print(p)
    dev.off()
}

df <- read.table("robos-dados.txt", head=T, sep=",")
imageActivity(df)
imagePopularity(df)
imageVisibility(df)