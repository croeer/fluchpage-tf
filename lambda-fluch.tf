data "archive_file" "lambda_fluch_zip" {
  type        = "zip"
  output_path = "lambda-src/fluch.zip"
  source_file = "lambda-src/fluch.mjs"
}

module "lambda_fluch_label" {
  source     = "cloudposse/label/null"
  version    = "0.25"
  context    = module.this.context
  name       = "${var.app_name}-fluch"
  attributes = ["lambda"]
}

module "lambda_fluch" {
  source = "git::https://github.com/croeer/aws-lambda-tf.git?ref=v1.1.0"

  function_name = module.lambda_fluch_label.id
  tags          = module.lambda_fluch_label.tags
  zipfile_name  = data.archive_file.lambda_fluch_zip.output_path
  handler_name  = "fluch.lambda_handler"
  runtime       = "nodejs22.x"
  environment_variables = {
    GOOGLE_API_KEY = var.google_api_key,
    FLUCH_PROMPT   = var.fluch_prompt,
  }

  create_function_url = true

}
