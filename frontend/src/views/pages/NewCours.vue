<template>
  <div class="vx-row">
    <div class="vx-col w-1/2">
      <vx-card>
        <h4>Form</h4>
        <div class="vx-row mb-2">
          <div class="vx-col w-full">
            <vs-input class="w-full" label="Name" v-model="name" />
          </div>
        </div>
        <div class="vx-row mb-2">
          <div class="vx-col w-full">
            <vs-input class="w-full" type="number" label="Price" v-model="price" />
          </div>
        </div>
        <div class="vx-row">
          <div class="vx-col w-full">
            <label class="vs-input--label">Description</label>
            <vs-textarea counter="250" :counter-danger.sync="counterDanger" v-model="description" />
          </div>
        </div>
        <div class="vx-row mb-2">
          <div class="vx-col w-full">
            <vs-upload ref="upload" limit="1" :show-upload-button="false" @input="submit" />
          </div>
        </div>
        <vs-button type="gradient" color="success" @click="submit">Add</vs-button>
      </vx-card>
    </div>
    <div class="vx-col w-1/4">
      <vx-card>
        <img :src="imagePreview" alt="content-img" class="responsive rounded-lg">
        <div class="my-6">
          <h5 class="mb-2 flex justify-between">
            <vx-tooltip color="primary" text="Adam Nowak">
              <vs-avatar class="mr-5" src="https://i.imgur.com/ezM6SJ5.png" style="min-width: 32px"/>
            </vx-tooltip>
            {{ name }}
          </h5>
          <p class="text-grey">{{ description }}</p>
        </div>
        <vs-divider></vs-divider>
        <div class="flex justify-between flex-wrap">
          <span class="pt-2">
            <p class="text-xl">
              <vs-chip color="primary">
                <vs-avatar color="light-primary" icon-pack="feather" icon="icon-dollar-sign" />
                <span class="px-2 font-bold" style="letter-spacing: 1px">{{ price }}.00</span>
              </vs-chip>
            </p>
          </span>
          <span>
            <p class="text-xl">
              <vs-button type="flat" line-origin="left" color="primary">Buy</vs-button>
            </p>
          </span>
        </div>
      </vx-card>
    </div>
  </div>
</template>

<script>
export default {
  name: "NewCours",
  data: () => ({
    name: 'PHP with Laravel for beginners - Become a Master in Laravel',
    description: 'PHP with Laravel for beginners - Become a Master in Laravel',
    fileToUpload: '',
    imagePreview: 'https://pixinvent.com/demo/vuesax-vuexy-vuejs-admin-dashboard-template/demo-1/img/content-img-2.00ef7d97.jpg',
    price: '465',
    counterDanger: false,
  }),
  mounted () {
    this.$watch(
        () => {
            return this.$refs.upload.filesx
        },
        (val) => {
          const $this = this
          const file = val.filter(image => !image.remove)[0];
          const reader = new FileReader();

          $this.fileToUpload = file
          reader.onloadend = function() {
            $this.imagePreview = reader.result
          }
          reader.readAsDataURL(file);
        }
    )
  },
  methods: {
    submit() {
      console.log(this.$store.dispatch('TEST'))
    },
  },
}
</script>

<style>
  .con-img-upload {
    padding: 2px;
  }
  .con-input-upload, .img-upload {
    margin: 0 !important;
  }
</style>
