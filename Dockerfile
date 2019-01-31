FROM hashicorp/terraform:light
WORKDIR /app
CMD ["terraform", "init"]

