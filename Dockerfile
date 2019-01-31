FROM hashicorp/terraform:light
WORKDIR /app
ENTRYPOINT ["terraform"]
CMD ["init"]

