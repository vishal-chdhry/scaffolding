/**
 * Copyright 2022 The Sigstore Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// KMS resources
module "kms" {
  source = "../kms"

  region       = var.region
  project_id   = var.project_id
  cluster_name = var.cluster_name

  name     = var.kms_keyring
  location = var.kms_location
  key_name = var.kms_key_name
}

// Redis for Rekor.
module "redis" {
  source = "../redis"

  region     = var.region
  project_id = var.project_id

  cluster_name = var.cluster_name

  network = var.network
}