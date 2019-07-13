<template>
  <div id="app">
    <div>
      <div class="container" ref="wise">
        <beet-color-box
          v-model="testData"
          tag="wise"
          ref="testText"
          maxlength="100"
          @add="handleAdd"
        >
          <div v-if="show">
            <div>
              <label>模版内容</label>
              <input type="text" v-model="form.text" />
            </div>
            <div>
              <button @click="addTag(form.text)">save</button>
            </div>
          </div>
        </beet-color-box>
        <div v-html="testData"></div>
      </div>
    </div>
    <beet-ant-color></beet-ant-color>
  </div>
</template>

<script>
export default {
  name: "app",
  components: {},
  data() {
    return {
      testData: "",
      listData: [],
      show: false,
      form: {
        text: ""
      }
    };
  },
  methods: {
    add() {
      this.listData.push({ text: "" });
    },
    handleDelete(index) {
      this.listData.splice(index, 1);
      console.log("list", this.listData);
    },
    handleAdd(type) {
      if (type === "tag") {
        this.show = true;
      } else {
        console.log(type);
      }
    },
    addTag(text) {
      this.$refs.testText.addTag(text);
      console.log("testdata", this.testData);
      this.show = false;
    }
  }
};
</script>

<style lang="scss"></style>
