require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
  cloud_name: "victorbarh",
  api_key:    "893546862154776",
  api_secret: "Oko75CZQLY6h26gRTpGF1AawQlc",
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "jumia"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new,(prefix: "jumia"), # for uploaded versions
}