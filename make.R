
# ---- project execution
targets::tar_config_set(
  store  = "outputs/pipeline/",
  script = "analyses/pipeline.R"
)

targets::tar_visnetwork()
targets::tar_make()
