// Kamanga Primary - API Integration and UI Management
// Global configuration
const API_BASE_URL = '/api';

// Utility functions
const showMessage = (message, type = 'success') => {
  const messageDiv = document.createElement('div');
  messageDiv.className = `message-${type}`;
  messageDiv.textContent = message;
  document.body.appendChild(messageDiv);
  
  setTimeout(() => {
    messageDiv.remove();
  }, 3000);
};

const showLoading = (element) => {
  element.classList.add('loading');
  element.innerHTML = '<div class="spinner"></div>';
};

const hideLoading = (element) => {
  element.classList.remove('loading');
};

// Generic API functions
const apiCall = async (endpoint, options = {}) => {
  try {
    const response = await fetch(`${API_BASE_URL}${endpoint}`, {
      headers: {
        'Content-Type': 'application/json',
        ...options.headers
      },
      ...options
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('API Error:', error);
    showMessage(error.message, 'error');
    throw error;
  }
};

// ==================== STUDENTS MODULE ====================
const StudentsAPI = {
  getAll: () => apiCall('/students'),
  getById: (id) => apiCall(`/students/${id}`),
  create: (student) => apiCall('/students', {
    method: 'POST',
    body: JSON.stringify(student)
  }),
  update: (id, student) => apiCall(`/students/${id}`, {
    method: 'PUT',
    body: JSON.stringify(student)
  }),
  delete: (id) => apiCall(`/students/${id}`, { method: 'DELETE' })
};

const loadStudents = async () => {
  const tbody = document.getElementById('students-tbody');
  if (!tbody) return;
  
  try {
    showLoading(tbody);
    const students = await StudentsAPI.getAll();
    
    tbody.innerHTML = students.map(student => `
      <tr>
        <td>${student.firstName}</td>
        <td>${student.lastName}</td>
        <td>${student.email}</td>
        <td>
          <button class="btn btn-sm btn-primary" onclick="editStudent(${student.id})">
            <i class="fas fa-edit"></i> Edit
          </button>
          <button class="btn btn-sm btn-danger" onclick="deleteStudent(${student.id})">
            <i class="fas fa-trash"></i> Delete
          </button>
        </td>
      </tr>
    `).join('');
    
    hideLoading(tbody);
  } catch (error) {
    hideLoading(tbody);
    showMessage('Failed to load students', 'error');
  }
};

const addStudent = async () => {
  const form = document.getElementById('studentForm');
  if (!form) return;
  
  const formData = new FormData(form);
  const student = {
    firstName: formData.get('firstName'),
    lastName: formData.get('lastName'),
    email: formData.get('email')
  };
  
  try {
    await StudentsAPI.create(student);
    showMessage('Student added successfully');
    form.reset();
    loadStudents();
  } catch (error) {
    showMessage('Failed to add student', 'error');
  }
};

const editStudent = async (id) => {
  try {
    const student = await StudentsAPI.getById(id);
    // Populate edit form
    document.getElementById('editStudentId').value = student.id;
    document.getElementById('editFirstName').value = student.firstName;
    document.getElementById('editLastName').value = student.lastName;
    document.getElementById('editEmail').value = student.email;
    
    // Show edit modal
    const editModal = new bootstrap.Modal(document.getElementById('editStudentModal'));
    editModal.show();
  } catch (error) {
    showMessage('Failed to load student details', 'error');
  }
};

const updateStudent = async () => {
  const id = document.getElementById('editStudentId').value;
  const student = {
    firstName: document.getElementById('editFirstName').value,
    lastName: document.getElementById('editLastName').value,
    email: document.getElementById('editEmail').value
  };
  
  try {
    await StudentsAPI.update(id, student);
    showMessage('Student updated successfully');
    loadStudents();
    
    // Hide modal
    const editModal = bootstrap.Modal.getInstance(document.getElementById('editStudentModal'));
    editModal.hide();
  } catch (error) {
    showMessage('Failed to update student', 'error');
  }
};

const deleteStudent = async (id) => {
  if (!confirm('Are you sure you want to delete this student?')) return;
  
  try {
    await StudentsAPI.delete(id);
    showMessage('Student deleted successfully');
    loadStudents();
  } catch (error) {
    showMessage('Failed to delete student', 'error');
  }
};

// ==================== ATTENDANCE MODULE ====================
const AttendanceAPI = {
  getAll: () => apiCall('/attendance'),
  getById: (id) => apiCall(`/attendance/${id}`),
  getByStudent: (studentId) => apiCall(`/attendance/student/${studentId}`),
  create: (record) => apiCall('/attendance', {
    method: 'POST',
    body: JSON.stringify(record)
  }),
  update: (id, record) => apiCall(`/attendance/${id}`, {
    method: 'PUT',
    body: JSON.stringify(record)
  }),
  delete: (id) => apiCall(`/attendance/${id}`, { method: 'DELETE' })
};

const loadAttendance = async () => {
  const tbody = document.getElementById('attendance-tbody');
  if (!tbody) return;
  
  try {
    showLoading(tbody);
    const records = await AttendanceAPI.getAll();
    
    tbody.innerHTML = records.map(record => `
      <tr>
        <td>${record.student ? record.student.firstName + ' ' + record.student.lastName : 'N/A'}</td>
        <td>${record.date}</td>
        <td>
          <span class="badge ${record.present ? 'bg-success' : 'bg-danger'}">
            ${record.present ? 'Present' : 'Absent'}
          </span>
        </td>
        <td>
          <button class="btn btn-sm btn-primary" onclick="editAttendance(${record.id})">
            <i class="fas fa-edit"></i> Edit
          </button>
          <button class="btn btn-sm btn-danger" onclick="deleteAttendance(${record.id})">
            <i class="fas fa-trash"></i> Delete
          </button>
        </td>
      </tr>
    `).join('');
    
    hideLoading(tbody);
  } catch (error) {
    hideLoading(tbody);
    showMessage('Failed to load attendance records', 'error');
  }
};

const addAttendance = async () => {
  const form = document.getElementById('attendanceForm');
  if (!form) return;
  
  const formData = new FormData(form);
  const record = {
    student: { id: parseInt(formData.get('studentId')) },
    date: formData.get('date'),
    present: formData.get('present') === 'true'
  };
  
  try {
    await AttendanceAPI.create(record);
    showMessage('Attendance record added successfully');
    form.reset();
    loadAttendance();
  } catch (error) {
    showMessage('Failed to add attendance record', 'error');
  }
};

// ==================== STAFF MODULE ====================
const StaffAPI = {
  getAll: () => apiCall('/staff'),
  getById: (id) => apiCall(`/staff/${id}`),
  create: (staff) => apiCall('/staff', {
    method: 'POST',
    body: JSON.stringify(staff)
  }),
  update: (id, staff) => apiCall(`/staff/${id}`, {
    method: 'PUT',
    body: JSON.stringify(staff)
  }),
  delete: (id) => apiCall(`/staff/${id}`, { method: 'DELETE' })
};

const loadStaff = async () => {
  const tbody = document.getElementById('staff-tbody');
  if (!tbody) return;
  
  try {
    showLoading(tbody);
    const staffList = await StaffAPI.getAll();
    
    tbody.innerHTML = staffList.map(staff => `
      <tr>
        <td>${staff.firstName}</td>
        <td>${staff.lastName}</td>
        <td>${staff.email}</td>
        <td>${staff.position}</td>
        <td>
          <button class="btn btn-sm btn-primary" onclick="editStaff(${staff.id})">
            <i class="fas fa-edit"></i> Edit
          </button>
          <button class="btn btn-sm btn-danger" onclick="deleteStaff(${staff.id})">
            <i class="fas fa-trash"></i> Delete
          </button>
        </td>
      </tr>
    `).join('');
    
    hideLoading(tbody);
  } catch (error) {
    hideLoading(tbody);
    showMessage('Failed to load staff', 'error');
  }
};

const addStaff = async () => {
  const form = document.getElementById('staffForm');
  if (!form) return;
  
  const formData = new FormData(form);
  const staff = {
    firstName: formData.get('firstName'),
    lastName: formData.get('lastName'),
    email: formData.get('email'),
    position: formData.get('position')
  };
  
  try {
    await StaffAPI.create(staff);
    showMessage('Staff member added successfully');
    form.reset();
    loadStaff();
  } catch (error) {
    showMessage('Failed to add staff member', 'error');
  }
};

// ==================== FINANCE MODULE ====================
const FinanceAPI = {
  getAll: () => apiCall('/finance'),
  getById: (id) => apiCall(`/finance/${id}`),
  create: (record) => apiCall('/finance', {
    method: 'POST',
    body: JSON.stringify(record)
  }),
  update: (id, record) => apiCall(`/finance/${id}`, {
    method: 'PUT',
    body: JSON.stringify(record)
  }),
  delete: (id) => apiCall(`/finance/${id}`, { method: 'DELETE' })
};

const loadFinanceRecords = async () => {
  const tbody = document.getElementById('finance-tbody');
  if (!tbody) return;
  
  try {
    showLoading(tbody);
    const records = await FinanceAPI.getAll();
    
    tbody.innerHTML = records.map(record => `
      <tr>
        <td>${record.description}</td>
        <td>$${record.amount}</td>
        <td>${record.type}</td>
        <td>${record.date}</td>
        <td>
          <button class="btn btn-sm btn-primary" onclick="editFinanceRecord(${record.id})">
            <i class="fas fa-edit"></i> Edit
          </button>
          <button class="btn btn-sm btn-danger" onclick="deleteFinanceRecord(${record.id})">
            <i class="fas fa-trash"></i> Delete
          </button>
        </td>
      </tr>
    `).join('');
    
    hideLoading(tbody);
  } catch (error) {
    hideLoading(tbody);
    showMessage('Failed to load finance records', 'error');
  }
};

const addFinanceRecord = async () => {
  const form = document.getElementById('financeForm');
  if (!form) return;
  
  const formData = new FormData(form);
  const record = {
    description: formData.get('description'),
    amount: parseFloat(formData.get('amount')),
    type: formData.get('type'),
    date: formData.get('date')
  };
  
  try {
    await FinanceAPI.create(record);
    showMessage('Finance record added successfully');
    form.reset();
    loadFinanceRecords();
  } catch (error) {
    showMessage('Failed to add finance record', 'error');
  }
};

// ==================== HOMEWORK MODULE ====================
const HomeworkAPI = {
  getAll: () => apiCall('/homework'),
  getById: (id) => apiCall(`/homework/${id}`),
  create: (homework) => apiCall('/homework', {
    method: 'POST',
    body: JSON.stringify(homework)
  }),
  update: (id, homework) => apiCall(`/homework/${id}`, {
    method: 'PUT',
    body: JSON.stringify(homework)
  }),
  delete: (id) => apiCall(`/homework/${id}`, { method: 'DELETE' })
};

const loadHomework = async () => {
  const container = document.getElementById('homework-container');
  if (!container) return;
  
  try {
    showLoading(container);
    const homeworkList = await HomeworkAPI.getAll();
    
    container.innerHTML = homeworkList.map(hw => `
      <div class="homework-item">
        <h5>${hw.title}</h5>
        <p>${hw.description}</p>
        <small class="text-muted">Due: ${hw.dueDate}</small>
        <div class="mt-2">
          <button class="btn btn-sm btn-primary" onclick="editHomework(${hw.id})">
            <i class="fas fa-edit"></i> Edit
          </button>
          <button class="btn btn-sm btn-danger" onclick="deleteHomework(${hw.id})">
            <i class="fas fa-trash"></i> Delete
          </button>
        </div>
      </div>
    `).join('');
    
    hideLoading(container);
  } catch (error) {
    hideLoading(container);
    showMessage('Failed to load homework', 'error');
  }
};

const addHomework = async () => {
  const form = document.getElementById('homeworkForm');
  if (!form) return;
  
  const formData = new FormData(form);
  const homework = {
    title: formData.get('title'),
    description: formData.get('description'),
    dueDate: formData.get('dueDate')
  };
  
  try {
    await HomeworkAPI.create(homework);
    showMessage('Homework added successfully');
    form.reset();
    loadHomework();
  } catch (error) {
    showMessage('Failed to add homework', 'error');
  }
};

// ==================== INVENTORY MODULE ====================
const InventoryAPI = {
  getAll: () => apiCall('/inventory'),
  getById: (id) => apiCall(`/inventory/${id}`),
  create: (item) => apiCall('/inventory', {
    method: 'POST',
    body: JSON.stringify(item)
  }),
  update: (id, item) => apiCall(`/inventory/${id}`, {
    method: 'PUT',
    body: JSON.stringify(item)
  }),
  delete: (id) => apiCall(`/inventory/${id}`, { method: 'DELETE' })
};

const loadInventory = async () => {
  const tbody = document.getElementById('inventory-tbody');
  if (!tbody) return;
  
  try {
    showLoading(tbody);
    const items = await InventoryAPI.getAll();
    
    tbody.innerHTML = items.map(item => `
      <tr>
        <td>${item.name}</td>
        <td>${item.quantity}</td>
        <td>${item.location}</td>
        <td>
          <button class="btn btn-sm btn-primary" onclick="editInventoryItem(${item.id})">
            <i class="fas fa-edit"></i> Edit
          </button>
          <button class="btn btn-sm btn-danger" onclick="deleteInventoryItem(${item.id})">
            <i class="fas fa-trash"></i> Delete
          </button>
        </td>
      </tr>
    `).join('');
    
    hideLoading(tbody);
  } catch (error) {
    hideLoading(tbody);
    showMessage('Failed to load inventory', 'error');
  }
};

const addInventoryItem = async () => {
  const form = document.getElementById('inventoryForm');
  if (!form) return;
  
  const formData = new FormData(form);
  const item = {
    name: formData.get('name'),
    quantity: parseInt(formData.get('quantity')),
    location: formData.get('location')
  };
  
  try {
    await InventoryAPI.create(item);
    showMessage('Inventory item added successfully');
    form.reset();
    loadInventory();
  } catch (error) {
    showMessage('Failed to add inventory item', 'error');
  }
};

// ==================== TRANSPORT MODULE ====================
const TransportAPI = {
  getAll: () => apiCall('/transport'),
  getById: (id) => apiCall(`/transport/${id}`),
  create: (record) => apiCall('/transport', {
    method: 'POST',
    body: JSON.stringify(record)
  }),
  update: (id, record) => apiCall(`/transport/${id}`, {
    method: 'PUT',
    body: JSON.stringify(record)
  }),
  delete: (id) => apiCall(`/transport/${id}`, { method: 'DELETE' })
};

const loadTransportRecords = async () => {
  const tbody = document.getElementById('transport-tbody');
  if (!tbody) return;
  
  try {
    showLoading(tbody);
    const records = await TransportAPI.getAll();
    
    tbody.innerHTML = records.map(record => `
      <tr>
        <td>${record.route}</td>
        <td>${record.driver}</td>
        <td>${record.vehicleNumber}</td>
        <td>
          <button class="btn btn-sm btn-primary" onclick="editTransportRecord(${record.id})">
            <i class="fas fa-edit"></i> Edit
          </button>
          <button class="btn btn-sm btn-danger" onclick="deleteTransportRecord(${record.id})">
            <i class="fas fa-trash"></i> Delete
          </button>
        </td>
      </tr>
    `).join('');
    
    hideLoading(tbody);
  } catch (error) {
    hideLoading(tbody);
    showMessage('Failed to load transport records', 'error');
  }
};

const addTransportRecord = async () => {
  const form = document.getElementById('transportForm');
  if (!form) return;
  
  const formData = new FormData(form);
  const record = {
    route: formData.get('route'),
    driver: formData.get('driver'),
    vehicleNumber: formData.get('vehicleNumber')
  };
  
  try {
    await TransportAPI.create(record);
    showMessage('Transport record added successfully');
    form.reset();
    loadTransportRecords();
  } catch (error) {
    showMessage('Failed to add transport record', 'error');
  }
};

// ==================== DASHBOARD FUNCTIONS ====================
const loadDashboardStats = async () => {
  try {
    // Load counts for dashboard cards
    const [students, staff, attendance, finance] = await Promise.all([
      StudentsAPI.getAll(),
      StaffAPI.getAll(),
      AttendanceAPI.getAll(),
      FinanceAPI.getAll()
    ]);
    
    document.getElementById('totalStudents').textContent = students.length;
    document.getElementById('totalStaff').textContent = staff.length;
    document.getElementById('totalClasses').textContent = Math.ceil(students.length / 30); // Estimate
    document.getElementById('totalAttendance').textContent = attendance.length;
  } catch (error) {
    showMessage('Failed to load dashboard stats', 'error');
  }
};

// ==================== DARK MODE TOGGLE ====================
const toggleDarkMode = () => {
  const body = document.body;
  const currentTheme = body.getAttribute('data-theme');
  const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
  
  body.setAttribute('data-theme', newTheme);
  localStorage.setItem('theme', newTheme);
  
  const icon = document.querySelector('#darkModeToggle i');
  icon.className = newTheme === 'dark' ? 'fa-solid fa-sun' : 'fa-solid fa-moon';
};

// ==================== INITIALIZATION ====================
document.addEventListener('DOMContentLoaded', function() {
  // Initialize Bootstrap tooltips
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
    new bootstrap.Tooltip(tooltipTriggerEl);
  });
  
  // Load theme from localStorage
  const savedTheme = localStorage.getItem('theme') || 'light';
  document.body.setAttribute('data-theme', savedTheme);
  
  // Set dark mode toggle icon
  const darkModeToggle = document.getElementById('darkModeToggle');
  if (darkModeToggle) {
    const icon = darkModeToggle.querySelector('i');
    icon.className = savedTheme === 'dark' ? 'fa-solid fa-sun' : 'fa-solid fa-moon';
  }
  
  // Auto-load data based on current page
  const currentPage = window.location.pathname.split('/').pop();
  
  switch (currentPage) {
    case 'students.html':
      loadStudents();
      break;
    case 'attendance.html':
      loadAttendance();
      break;
    case 'staff.html':
      loadStaff();
      break;
    case 'finance.html':
      loadFinanceRecords();
      break;
    case 'homework.html':
      loadHomework();
      break;
    case 'inventory.html':
      loadInventory();
      break;
    case 'transport.html':
      loadTransportRecords();
      break;
    case 'dashboard.html':
      loadDashboardStats();
      break;
  }
});

// Export functions for use in HTML
window.loadStudents = loadStudents;
window.addStudent = addStudent;
window.editStudent = editStudent;
window.updateStudent = updateStudent;
window.deleteStudent = deleteStudent;

window.loadAttendance = loadAttendance;
window.addAttendance = addAttendance;

window.loadStaff = loadStaff;
window.addStaff = addStaff;

window.loadFinanceRecords = loadFinanceRecords;
window.addFinanceRecord = addFinanceRecord;

window.loadHomework = loadHomework;
window.addHomework = addHomework;

window.loadInventory = loadInventory;
window.addInventoryItem = addInventoryItem;

window.loadTransportRecords = loadTransportRecords;
window.addTransportRecord = addTransportRecord;

window.toggleDarkMode = toggleDarkMode;
