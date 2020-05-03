<template>
  <div>
    <div class="container" ref="container">
      <div class="wrap clearfix">
        <div class="th-row th-col-50">
          <div class="row-box">
            <div class="th-label">头像</div>
            <el-upload
              class="avatar-uploader"
              action="http://172.16.3.223:3000/upload"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload">
              <img v-if="avatar" :src="avatar" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </div>
        </div>
        <div class="th-row th-col-50">
          <div class="row-box">
            <div class="th-label">形象照</div>
            <el-upload
              class="photo-uploader"
              action="http://172.16.3.223:3000/upload"
              :show-file-list="false"
              :on-success="handlePhotoSuccess"
              :before-upload="beforePhotoUpload">
              <img v-if="photo" :src="photo" class="photo">
              <i v-else class="el-icon-plus photo-uploader-icon"></i>
            </el-upload>
          </div>
        </div>
        <div class="th-row">
          <div class="th-form-title">
            <div class="th-form-title-left">
              <span>个人信息</span>
              <img src="../../../static/image/arrow-right.png">
            </div>
            <div class="th-form-title-right">
              <th-button type="save" @click.native="savePersonalInfo">保 存</th-button>
            </div>
          </div>
        </div>
        <div class="th-row th-col-50">
          <div class="row-box">
            <div class="th-label">姓名</div>
            <input type="text" class="th-input" v-model="data.nick_name">
          </div>
        </div>
        <div class="th-row th-col-50">
          <div class="row-box">
            <div class="th-label">年龄</div>
            <input type="text" class="th-input" v-model="data.age">
          </div>
        </div>
        <div class="th-row th-col-50">
          <div class="row-box">
            <div class="th-label">籍贯</div>
            <input type="text" class="th-input" v-model="data.hometown">
          </div>
        </div>
        <div class="th-row th-col-50">
          <div class="row-box">
            <div class="th-label">民族</div>
            <input type="text" class="th-input" v-model="data.nation">
          </div>
        </div>
        <div class="th-row th-col-50">
          <div class="row-box">
            <div class="th-label">现居地</div>
            <input type="text" class="th-input" v-model="data.residence">
          </div>
        </div>
        <div class="th-row">
          <div class="th-form-title">
            <div class="th-form-title-left">
              <span>最高学历</span>
              <img src="../../../static/image/arrow-right.png">
            </div>
            <div class="th-form-title-right">
              <th-button type="save" @click.native="saveEducationInfo">保 存</th-button>
            </div>
          </div>
        </div>
        <div class="th-row">
          <div class="th-row th-col-50">
            <div class="row-box">
              <div class="th-label">学历</div>
              <input type="text" class="th-input" v-model="data.education">
            </div>
          </div>
          <div class="th-row th-col-50">
            <div class="row-box">
              <div class="th-label">年份</div>
              <input type="text" class="th-input" v-model="data.study_years">
            </div>
          </div>
        </div>
        <div class="th-row th-col-50">
          <div class="row-box">
            <div class="th-label">专业</div>
            <input type="text" class="th-input" v-model="data.major">
          </div>
        </div>
        <div class="th-row th-col-50">
          <div class="row-box">
            <div class="th-label">学校</div>
            <input type="text" class="th-input" v-model="data.school">
          </div>
        </div>
        <div class="th-row">
          <div class="th-form-title">
            <div class="th-form-title-left">
              <span>工作经历</span>
              <img src="../../../static/image/arrow-right.png">
            </div>
            <div class="th-form-title-right">
              <th-button v-if="companyIdx !== ''" type="del" @click.native="delCompany">删 除</th-button>
              <th-button type="add" @click.native="addCompany">新 增</th-button>
              <th-button type="save" @click.native="saveWorkInfo">保 存</th-button>
            </div>
          </div>
        </div>
        <div class="th-row" :class="{'del-box': index === companyIdx}" ref="company" @click="choCompany(index)" v-for="(item, index) in companys" :key="index">
          <div class="th-row th-col-50">
            <div class="row-box">
              <div class="th-label">公司名称</div>
              <input type="text" class="th-input" v-model="dataCompany[index].value">
            </div>
          </div>
          <div class="th-row th-col-50">
            <div class="row-box">
              <div class="th-label">在职时间</div>
              <input type="text" class="th-input" v-model="dataWorkYear[index].value">
            </div>
          </div>
          <div class="th-row th-col-50">
            <div class="row-box">
              <div class="th-label">工作岗位</div>
              <input type="text" class="th-input" v-model="dataPosi[index].value">
            </div>
          </div>
        </div>
        <div class="th-row">
          <div class="th-form-title">
            <div class="th-form-title-left">
              <span>项目经历</span>
              <img src="../../../static/image/arrow-right.png">
            </div>
            <div class="th-form-title-right">
              <th-button v-if="projectIdx !== ''" type="del" @click.native="delProject">删 除</th-button>
              <th-button type="add" @click.native="addProject">新 增</th-button>
              <th-button type="save" @click.native="saveProjectInfo">保 存</th-button>
            </div>
          </div>
        </div>
        <div class="th-row" :class="{'del-box': index === projectIdx}" ref="project" @click="choProject(index)" v-for="(item, index) in projects" :key="item.name">
          <div class="th-row th-col-50">
            <div class="row-box">
              <div class="th-label">项目名称</div>
              <input type="text" class="th-input" v-model="item.name">
            </div>
          </div>
          <div class="th-row th-col-50">
            <div class="row-box">
              <div class="th-label">项目工期</div>
              <input type="text" class="th-input" v-model="item.period">
            </div>
          </div>
          <div class="th-row th-col-50">
            <div class="row-box">
              <div class="th-label">工作职责</div>
              <textarea type="text" class="th-textarea" v-model="item.duty"/>
            </div>
          </div>
          <div class="th-row th-col-50">
            <div class="row-box">
              <div class="th-label">工作描述</div>
              <textarea type="text" class="th-textarea" v-model="item.work_content"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import thButton from '../../../component/thButton.vue'
import axios from '../../axios'
export default{
  components: { thButton },
  data () {
    return {
      avatar: '',
      photo: '',
      data: '',
      companys: [],
      company: '',
      workYears: '',
      position: '',
      companyIdx: '',
      projects: [],
      projectIdx: '',
      isModifyData: false,
      isModifyComp: false,
      isModifyProj: false
    }
  },
  created () {
    this.getData()
  },
  mounted () {
    this.$refs.container.addEventListener('click', (e) => {
      if (this.companyIdx !== '') {
        if (!this.$refs.company[this.companyIdx].contains(e.target)) {
          this.companyIdx = ''
        }
      }
    })
    this.$refs.container.addEventListener('click', (e) => {
      if (this.projectIdx !== '') {
        if (!this.$refs.project[this.projectIdx].contains(e.target)) {
          this.projectIdx = ''
        }
      }
    })
  },
  watch: {
    data: {
      deep: true,
      handler: function (newVal, oldVal) {
        if (oldVal !== '') {
          this.isModifyData = true
        }
      }
    },
    companys: function (newVal, oldVal) {
      if (oldVal.length !== 0) {
        this.isModifyComp = true
      }
    },
    projects: function (newVal, oldVal) {
      if (oldVal.length !== 0) {
        this.isModifyProj = true
        console.log(this.isModifyProj, this.isModifyData)
      }
    }
  },
  computed: {
    dataCompany () {
      let result = []
      this.company.split(',').forEach((val, idx) => {
        result[idx] = {value: val}
        return result
      })
      return result
    },
    dataWorkYear () {
      let result = []
      this.workYears.split(',').forEach((val, idx) => {
        result[idx] = {value: val}
        return result
      })
      return result
    },
    dataPosi () {
      let result = []
      this.position.split(',').forEach((val, idx) => {
        result[idx] = {value: val}
        return result
      })
      return result
    }
  },
  beforeRouteLeave (to, from, next) {
    if (this.isModifyData || this.isModifyComp || this.isModifyProj) {
      this.$confirm('离开此页将不会保存当前更改！', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        next()
      }).catch(() => {})
    } else {
      next()
    }
  },
  methods: {
    savePersonalInfo () {
      let params = {
        username: sessionStorage.getItem('username'),
        nick_name: this.data.nick_name,
        age: +this.data.age,
        hometown: this.data.hometown,
        nation: this.data.nation,
        residence: this.data.residence
      }
      axios.post('/api/users/personal', {
        ...params
      })
        .then(res => {
          this.$message.success(res.data.msg)
          this.isModifyData = false
        })
        .catch(err => {
          this.$message.error(err)
        })
    },
    saveEducationInfo () {
      let params = {
        username: sessionStorage.getItem('username'),
        education: this.data.education,
        study_years: +this.data.study_years,
        major: this.data.major,
        school: this.data.school
      }
      axios.post('/api/users/education', {
        ...params
      })
        .then(res => {
          this.$message.success(res.data.msg)
          this.isModifyData = false
        })
        .catch(err => {
          this.$message.error(err)
        })
    },
    saveWorkInfo () {
      let [company, workYears, position] = [[], [], []]
      for (let item of this.dataCompany) {
        company.push(item.value)
      }
      for (let item of this.dataWorkYear) {
        workYears.push(item.value)
      }
      for (let item of this.dataPosi) {
        position.push(item.value)
      }
      company.join(',')
      workYears.join(',')
      position.join(',')
      let params = {
        username: sessionStorage.getItem('username'),
        company: company,
        work_years: workYears,
        position: position
      }
      axios.post('/api/users/company', {
        ...params
      })
        .then(res => {
          this.$message.success(res.data.msg)
          this.isModifyComp = false
        })
        .catch(err => {
          this.$message.error(err)
        })
    },
    saveProjectInfo () {
      axios.post('/api/users/project', {
        username: sessionStorage.getItem('username'),
        project: this.projects
      })
        .then(res => {
          this.$message.success(res.data.msg)
          this.isModifyProj = false
        })
        .catch(err => {
          this.$message.error(err)
        })
    },
    addCompany () { // 新增工作经历
      this.companys.push(1)
      this.dataCompany.push({value: ''})
      this.dataWorkYear.push({value: ''})
      this.dataPosi.push({value: ''})
    },
    delCompany () { // 删除工作经历
      this.companys.splice(this.companyIdx, 1)
      this.dataCompany.splice(this.companyIdx, 1)
      this.dataWorkYear.splice(this.companyIdx, 1)
      this.dataPosi.splice(this.companyIdx, 1)
      this.companyIdx -= 1
    },
    choCompany (index) {
      this.companyIdx = index
    },
    addProject () { // 新增工作经历
      this.projects.push({
        name: '',
        period: '',
        duty: '',
        work_content: ''
      })
    },
    delProject () { // 删除工作经历
      this.projects.splice(this.projectIdx, 1)
      this.projectIdx -= 1
    },
    choProject (index) {
      this.projectIdx = index
    },
    wrap () {
      this.companyIdx = ''
    },
    getData () {
      axios.get('/api/users/allInfo?username=' + sessionStorage.getItem('username') + '', {
      })
        .then(res => {
          this.data = res.data.result
          this.avatar = this.data.avatar
          this.photo = this.data.photo
          this.company = this.data.company
          this.workYears = this.data.work_years
          this.position = this.data.position
          this.companys = this.company.split(',')
          this.projects = res.data.result.project
          delete (this.data['project'])
        })
        .catch(err => {
          this.$message.error(err)
        })
    },
    handleAvatarSuccess (res, file) {
      // this.imageUrl = URL.createObjectURL(file.raw)
      if (res.status === '200') {
        this.avatar = res.imageSrc
      } else if (res.status === '-1') {
        this.$message.error(res.msg)
      }
    },
    beforeAvatarUpload (file) {
      const isJPG = file.type === 'image/jpeg'
      const isPNG = file.type === 'image/png'
      const isLt2M = file.size / 1024 / 1024 < 2
      if (!isJPG && !isPNG) {
        this.$message.error('上传头像图片只能是 JPG、PNG 格式!')
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!')
      }
      return (isJPG || isPNG) && isLt2M
    },
    handlePhotoSuccess (res, file) {
      // this.imageUrl = URL.createObjectURL(file.raw)
      if (res.status === '200') {
        this.photo = res.imageSrc
      } else if (res.status === '-1') {
        this.$message.error(res.msg)
      }
    },
    beforePhotoUpload (file) {
      const isJPG = file.type === 'image/jpeg'
      const isPNG = file.type === 'image/png'
      const isLt10M = file.size / 1024 / 1024 < 10
      if (!isJPG && !isPNG) {
        this.$message.error('上传形象照图片只能是 JPG、PNG 格式!')
      }
      if (!isLt10M) {
        this.$message.error('上传形象照图片大小不能超过 10MB!')
      }
      return (isJPG || isPNG) && isLt10M
    }
  }
}
</script>

<style scoped lang="scss">
@import '@/styles/public.scss';

.wrap {
  padding: 16px;
  .del-box {
    box-shadow: 0 0 4px inset red;
  }
}
</style>
