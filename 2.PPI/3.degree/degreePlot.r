library(ggplot2)
library(patchwork)

# 在数据框中添加颜色列
df1 <- data.frame(
  Protein_ID = c("J9JQH0", "J9K6V2", "J9KKA1", "J9K3K8", "J9JLB3", "J9LZL8", "J9JKN7", "J9K4G2", "J9K8L6", "J9K7T1", "J9KKD5", "J9JNJ5"),
  Degree = c(5, 4, 3, 2, 2, 2, 2, 1, 1, 1, 1, 1)
)
df1$Protein_ID <- factor(df1$Protein_ID, levels = rev(unique(df1$Protein_ID)))

df2 <- data.frame(
  Protein_ID = c("J9JTH4","J9JSB6", "Cdk5", "J9K871", "J9JP34", "J9K8T4",
                 "J9JW15", "J9K3U4", "J9K4Y7", "ACYPI003417", "J9JPF5",
                 "Usp", "Ckiibeta", "J9K7M8", "J9JPH9", "X1WIH6", "J9JLH1", "ACYPI009796"
                 ),
  Degree = c(10, 7, 7, 5, 4, 4, 4, 3, 3, 3, 2, 2, 2, 1, 1, 1, 1, 1)
)
df2$Protein_ID <- factor(df2$Protein_ID, levels = rev(unique(df2$Protein_ID)))

# 绘制第一个子图
p1 <- ggplot(df1, aes(x = Protein_ID, y = Degree, fill = Protein_ID)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme(
    panel.background = element_blank(),
    panel.border = element_rect(colour = "black", fill = NA, size = 1),
    plot.background = element_blank(),
    axis.line = element_blank(),
    axis.text.y = element_text(colour = "black"),
    axis.text.x = element_text(colour = "black"),
    axis.ticks = element_line(colour = "black"),
    plot.title = element_text(hjust = 0.5),
    legend.position = "none"
  ) +
  labs(title = "C1") +
  geom_text(aes(label = Degree), vjust = 0.4, hjust = 1, colour = "black") +
  scale_fill_manual(values = c("J9JQH0" = "pink", "J9K6V2" = "pink", 
                               "J9KKA1" = "lightblue", "J9K3K8" = "lightblue",
                               "J9JLB3" = "lightblue", "J9LZL8" = "lightblue",
                               "J9JKN7" = "lightblue", "J9K4G2" = "lightblue",
                               "J9K8L6" = "lightblue", "J9K7T1" = "lightblue",
                               "J9KKD5" = "lightblue", "J9JNJ5" = "lightblue"))

# 绘制第二个子图
p2 <- ggplot(df2, aes(x = Protein_ID, y = Degree, fill = Protein_ID)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme(
    panel.background = element_blank(),
    panel.border = element_rect(colour = "black", fill = NA, size = 1),
    plot.background = element_blank(),
    axis.line = element_blank(),
    axis.text.y = element_text(colour = "black"),
    axis.text.x = element_text(colour = "black"),
    axis.ticks = element_line(colour = "black"),
    plot.title = element_text(hjust = 0.5),
    legend.position = "none"
    #axis.title = element_blank(),
    #axis.title.y = element_text(colour = "black")
  ) +
  labs(title = "C2", x = NULL) +
  geom_text(aes(label = Degree), vjust = 0.4, hjust = 1, colour = "black") +
  scale_fill_manual(values = c("J9JTH4" = "pink", "J9JSB6" = "pink", 
                               "Cdk5" = "lightblue", "J9K871" = "lightblue",
                               "J9JP34" = "lightblue", "J9K8T4" = "lightblue",
                               "J9JW15" = "lightblue", "J9K3U4" = "lightgreen",
                               "J9K4Y7" = "lightblue", "ACYPI003417" = "lightblue",
                               "J9JPF5" = "lightblue", "Usp" = "lightblue",
                               "Ckiibeta" = "lightblue", "J9K7M8" = "lightblue",
                               "J9JPH9" = "lightblue", "X1WIH6" = "lightblue",
                               "J9JLH1" = "lightblue", "ACYPI009796" = "lightblue"))


# 打印组合后的图形
(pic <- p1 | p2)

ggsave(
  "degreePlot.png",
  pic
)
ggsave(
  "degreePlot.svg",
  pic
)
