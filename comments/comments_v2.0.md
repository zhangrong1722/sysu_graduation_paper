1. 修改reference style：采用MICCAI模板
2. 将科研成果目录中出现的人名以xxx代替
3. 将扉页出现的作者名字、导师名字、专业、学号等信息用xxx代替
4. ABSTRACT缩减至一页内
5. style.cls  line 69   \clearpage %\clearemptydoublepage
6. 将所有图表caption只用一行字描述 并在论文开头加入图表位置说明 对于有多列的图 在每一列加上说明文字
7. style.cls line133 \renewcommand{\theequation}{\thechapter.\arabic{equation}} %\renewcommand{\theequation}{\thechapter-\arabic{equation}} 将公式编码格式x-x改为x.x
8. 图\label{fig:popular_encoder_decoder}  拆分为子图	图\label{fig:popular_networks}拆分为子图
9. 论文结构与章节安排：重新排版latex description
10. 矩阵（大写字母，黑体，非斜体） 向量（小写字母 黑体 非斜体） 标量（小写字母 斜体）介绍GAN的数学公式 重新整理 介绍CAM和Grad-CAM的时候 公式重新整理
11. 第二章中列出不同方法 说明每种方式用了那种弱监督方法
12. 第三章损失函数写法
13. 将图表caption都缩短至一行，将图标汇总列在扉页
14. 将附录图标caption缩短 放至文字描述部分
15. 重新组织5.5小节实验描述 
16. 第二章GAN损失函数 重新整理
17. 该第三章title名字：只是“方法”二字太泛了
18. 重新写1.1小节的意义
19. 重新写MIL的应用和数学原理
