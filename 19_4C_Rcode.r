##### ��w���v�׋���18�@��4��@��A���́@R code #####

install.packages("IS��R")	# ISwR�p�b�P�[�W�̃C���X�g�[���B�ŏ��̈��̂ݎ��s
library(ISwR)

# �U�z�} #
thuesen <- na.omit(thuesen)	# �����l������ #
attach(thuesen)

plot(blood.glucose, short.velocity)
plot(thuesen)			# ��Ɠ���

# ���ʓI�f�[�^�̗v��i��ϗʁj #
cov(blood.glucose, short.velocity)		# �����U
cov(thuesen)				# ���U�����U�s��
cor(blood.glucose, short.velocity)		# ���֌W��
cor(thuesen)				# ���֍s��

# �P��A���� #
fit <- lm(short.velocity ~ blood.glucose, data=thuesen)
summary(fit)		# ��A���͂̌��ʕ\��
plot(thuesen)		# �U�z�}
abline(fit)			# ���肳�ꂽ��A�����̕`��
confint(fit)		# ��A�p�����^�[�̐M�����

# ��A�f�f #
par(mfrow=c(2,2))
plot(fit)
par(mfrow=c(1,1))

# �d��A (CPU�f�[�^) #
library(MASS)
head(cpus, n=2)
dim(cpus)			# cpus�̍s�Ɨ�̐����m�F
?cpus				# cpus�̃I�����C���w���v�N��

cpus2 <- cpus[, c(8, 2:7)]
head(cpus2, n=2)

pairs(cpus2)		# cpus2�̎U�z�}�s��

cpus2.lm <- lm(perf ~ syct + mmin + mmax + cach + chmin + chmax, data=cpus2)				# ��A���f���̓��Ă͂�
cpus2.lm <- lm(perf ~ ., data=cpus2)	# ��Ɠ���

summary(cpus2.lm)	# ��A���͂̌��ʕ\��
confint(cpus2.lm)	# ��A�p�����^�[�̐M�����

# ��A�f�f #
par(mfrow=c(2,2))	# �O���t�B�b�N�X�E�B���h�E��2�s2���4�̗̈�ɕ�������
plot(cpus2.lm)
par(mfrow=c(1,1))	# �O���t�B�b�N�X�E�B���h�E�����ɖ߂�

# Box-Cox�ϊ� #
library(MASS)
bxcx <- boxcox(perf ~ ., data=cpus2, lambda=seq(0, 0.5, .01))
lambda <- bxcx$x[which.max(bxcx$y)]
lambda

perf.new <- (cpus2$perf^lambda -1)/lambda
cpus3 <- cpus2[, -1]
cpus3 <- cbind.data.frame(perf.new, cpus3)

cpus2.bxcx.lm <- lm(perf.new ~ ., data=cpus3)
summary(cpus2.bxcx.lm)	# ��A���͂̌��ʕ\��
confint(cpus2.bxcx.lm)	# ��A�p�����^�[�̐M�����

# ��A�f�f #
par(mfrow=c(2,2))	# �O���t�B�b�N�X�E�B���h�E��2�s2���4�̗̈�ɕ�������
plot(cpus2.bxcx.lm)
par(mfrow=c(1,1))	# �O���t�B�b�N�X�E�B���h�E�����ɖ߂�
