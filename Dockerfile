FROM alpine:latest

WORKDIR /

RUN apk add git nodejs yarn npm neovim make go --update

ENV HOME=/home/user

COPY . $HOME/.config/nvim

RUN go install github.com/jesseduffield/lazygit@latest

CMD ["nvim"]
