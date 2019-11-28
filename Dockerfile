# �R�s�y��OK, app_name�����̂܂܂�OK
# 19.01.20���ݍŐV����ł̃C���[�W���擾
FROM ruby:2.5.3

# �K�v�ȃp�b�P�[�W�̃C���X�g�[���i��{�I�ɕK�v�ɂȂ��Ă�����̂��Ǝv���̂ō��Ȃ����Ɓj
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

# ��ƃf�B���N�g���̍쐬�A�ݒ�
RUN mkdir /app_name 
##��ƃf�B���N�g������APP_ROOT�Ɋ��蓖�ĂāA�ȉ�$APP_ROOT�ŎQ��
ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT

# �z�X�g���i���[�J���j��Gemfile��ǉ�����i���[�J����Gemfile�́y�R�z�ō쐬�j
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfile��bundle install
RUN bundle install
ADD . $APP_ROOT
