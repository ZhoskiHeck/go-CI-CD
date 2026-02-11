# Родительский образ для Go
FROM golang:1.22.0

# Рабочий каталог
WORKDIR /app

# Копирование модулей
COPY go.mod go.sum ./

# Установка зависимости
RUN go mod download

# Копирование кода файлов Go
COPY *.go ./

# Копирование базы данных
COPY tracker.db ./

# Сборка приложения
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go_app

# Запуск
CMD ["/go_app"]