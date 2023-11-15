<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside>
    <div class="w-64 bg-gray-800 h-screen">
        
        <div class="wrapper w-64 pt-5">
          <ul>
            <!-- Dashboard -->
            <li class="">
              <a
                href="/adminDashboard.html"
                class="flex px-6 py-4 text-sm font-bold text-gray-400"
              >
                <svg
                  stroke="currentColor"
                  fill="none"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="w-5 h-5"
                  aria-hidden="true"
                  height="1em"
                  width="1em"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <rect x="3" y="3" width="7" height="7"></rect>
                  <rect x="14" y="3" width="7" height="7"></rect>
                  <rect x="14" y="14" width="7" height="7"></rect>
                  <rect x="3" y="14" width="7" height="7"></rect>
                </svg>
                <span class="ml-4">Dashboard</span>
              </a>
            </li>

            <!-- Category -->
            <li class="px-6 py-4">
              <button class="flex text-sm font-bold text-gray-400">
                <svg
                  stroke="currentColor"
                  fill="none"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="w-5 h-5"
                  aria-hidden="true"
                  height="1em"
                  width="1em"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M14.5 10c-.83 0-1.5-.67-1.5-1.5v-5c0-.83.67-1.5 1.5-1.5s1.5.67 1.5 1.5v5c0 .83-.67 1.5-1.5 1.5z"
                  ></path>
                  <path
                    d="M20.5 10H19V8.5c0-.83.67-1.5 1.5-1.5s1.5.67 1.5 1.5-.67 1.5-1.5 1.5z"
                  ></path>
                  <path
                    d="M9.5 14c.83 0 1.5.67 1.5 1.5v5c0 .83-.67 1.5-1.5 1.5S8 21.33 8 20.5v-5c0-.83.67-1.5 1.5-1.5z"
                  ></path>
                  <path
                    d="M3.5 14H5v1.5c0 .83-.67 1.5-1.5 1.5S2 16.33 2 15.5 2.67 14 3.5 14z"
                  ></path>
                  <path
                    d="M14 14.5c0-.83.67-1.5 1.5-1.5h5c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5h-5c-.83 0-1.5-.67-1.5-1.5z"
                  ></path>
                  <path
                    d="M15.5 19H14v1.5c0 .83.67 1.5 1.5 1.5s1.5-.67 1.5-1.5-.67-1.5-1.5-1.5z"
                  ></path>
                  <path
                    d="M10 9.5C10 8.67 9.33 8 8.5 8h-5C2.67 8 2 8.67 2 9.5S2.67 11 3.5 11h5c.83 0 1.5-.67 1.5-1.5z"
                  ></path>
                  <path
                    d="M8.5 5H10V3.5C10 2.67 9.33 2 8.5 2S7 2.67 7 3.5 7.67 5 8.5 5z"
                  ></path>
                </svg>
                <span class="ml-4">Catalog</span>
                <span class="pl-4 mt-1">
                  <svg
                    stroke="currentColor"
                    fill="currentColor"
                    stroke-width="0"
                    viewBox="0 0 512 512"
                    height="1em"
                    width="1em"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      fill="none"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="48"
                      d="M184 112l144 144-144 144"
                    ></path>
                  </svg>
                </span>
              </button>

              <ul
                class="p-2 text-sm font-medium rounded-md text-gray-400 bg-gray-900 mt-2"
              >
                <li>
                    <a href="<c:url value="/admin/stored/products"/>" class="flex items-center py-2">
                    <span class="text-xs text-gray-500 pr-1"
                      ><svg
                        stroke="currentColor"
                        fill="currentColor"
                        stroke-width="0"
                        viewBox="0 0 512 512"
                        height="1em"
                        width="1em"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                          fill="none"
                          stroke-linecap="square"
                          stroke-linejoin="round"
                          stroke-width="32"
                          d="M400 256H112"
                        ></path>
                      </svg>
                    </span>
                    <span class="text-gray-500 hover:text-gray-200"
                      >Products</span
                    >
                  </a>
                </li>

                <li>
                  <a href="<c:url value="/admin/stored/categories"/>" class="flex items-center py-2">
                    <span class="text-xs text-gray-500 pr-1"
                      ><svg
                        stroke="currentColor"
                        fill="currentColor"
                        stroke-width="0"
                        viewBox="0 0 512 512"
                        height="1em"
                        width="1em"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                          fill="none"
                          stroke-linecap="square"
                          stroke-linejoin="round"
                          stroke-width="32"
                          d="M400 256H112"
                        ></path>
                      </svg>
                    </span>
                    <span class="text-gray-500 hover:text-gray-200"
                      >Categories</span
                    >
                  </a>
                </li>

                <li>
                  <a href="<c:url value="/admin/stored/promotions"/>" class="flex items-center py-2">
                    <span class="text-xs text-gray-500 pr-1"
                      ><svg
                        stroke="currentColor"
                        fill="currentColor"
                        stroke-width="0"
                        viewBox="0 0 512 512"
                        height="1em"
                        width="1em"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                          fill="none"
                          stroke-linecap="square"
                          stroke-linejoin="round"
                          stroke-width="32"
                          d="M400 256H112"
                        ></path>
                      </svg>
                    </span>
                    <span class="text-gray-500 hover:text-gray-200"
                      >Promotions</span
                    >
                  </a>
                </li>
              </ul>
            </li>

            <!-- Customers -->
            <li class="">
              <a
                href="<c:url value="/admin/stored/customers"/>"
                class="flex px-6 py-4 text-sm font-bold text-gray-400"
              >
                <svg
                  stroke="currentColor"
                  fill="none"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="w-5 h-5"
                  aria-hidden="true"
                  height="1em"
                  width="1em"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                  <circle cx="9" cy="7" r="4"></circle>
                  <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                  <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                </svg>
                <span class="ml-4">Customers</span>
              </a>
            </li>

            <!-- Orders -->
            <li class="">
              <a
                href="<c:url value="/admin/stored/orders"/>"
                class="flex px-6 py-4 text-sm font-bold text-gray-400"
              >
                <svg
                  stroke="currentColor"
                  fill="none"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="w-5 h-5"
                  aria-hidden="true"
                  height="1em"
                  width="1em"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <circle cx="12" cy="12" r="10"></circle>
                  <polygon
                    points="16.24 7.76 14.12 14.12 7.76 16.24 9.88 9.88 16.24 7.76"
                  ></polygon>
                </svg>
                <span class="ml-4">Orders</span>
              </a>
            </li>

            <!-- Our staff -->
            <li class="">
              <a
                href="<c:url value="/admin/stored/staffs"/>"
                class="flex px-6 py-4 text-sm font-bold text-gray-400"
              >
                <svg
                  stroke="currentColor"
                  fill="none"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="w-5 h-5"
                  aria-hidden="true"
                  height="1em"
                  width="1em"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                  <circle cx="12" cy="7" r="4"></circle>
                </svg>
                <span class="ml-4">Our staffs</span>
              </a>
            </li>

            <!-- online store -->
            <li class="px-6 py-4">
              <button class="flex text-sm font-bold text-gray-400">
                <svg
                  stroke="currentColor"
                  fill="none"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="w-5 h-5"
                  aria-hidden="true"
                  height="1em"
                  width="1em"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <circle cx="12" cy="12" r="10"></circle>
                  <circle cx="12" cy="12" r="6"></circle>
                  <circle cx="12" cy="12" r="2"></circle>
                </svg>
                <span class="ml-4">Online store</span>
                <span class="pl-4 mt-1">
                  <svg
                    stroke="currentColor"
                    fill="currentColor"
                    stroke-width="0"
                    viewBox="0 0 512 512"
                    height="1em"
                    width="1em"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      fill="none"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="48"
                      d="M184 112l144 144-144 144"
                    ></path>
                  </svg>
                </span>
              </button>

              <ul
                class="p-2 text-sm font-medium rounded-md text-gray-400 bg-gray-900 mt-2 hidden"
              >
                <li>
                  <a href="#" class="flex items-center py-2">
                    <span class="text-xs text-gray-500 pr-1"
                      ><svg
                        stroke="currentColor"
                        fill="currentColor"
                        stroke-width="0"
                        viewBox="0 0 512 512"
                        height="1em"
                        width="1em"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                          fill="none"
                          stroke-linecap="square"
                          stroke-linejoin="round"
                          stroke-width="32"
                          d="M400 256H112"
                        ></path>
                      </svg>
                    </span>
                    <span class="text-gray-500 hover:text-gray-200"
                      >Products</span
                    >
                  </a>
                </li>

                <li>
                  <a href="#" class="flex items-center py-2">
                    <span class="text-xs text-gray-500 pr-1"
                      ><svg
                        stroke="currentColor"
                        fill="currentColor"
                        stroke-width="0"
                        viewBox="0 0 512 512"
                        height="1em"
                        width="1em"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                          fill="none"
                          stroke-linecap="square"
                          stroke-linejoin="round"
                          stroke-width="32"
                          d="M400 256H112"
                        ></path>
                      </svg>
                    </span>
                    <span class="text-gray-500 hover:text-gray-200"
                      >Categories</span
                    >
                  </a>
                </li>

                <li>
                  <a href="#" class="flex items-center py-2">
                    <span class="text-xs text-gray-500 pr-1"
                      ><svg
                        stroke="currentColor"
                        fill="currentColor"
                        stroke-width="0"
                        viewBox="0 0 512 512"
                        height="1em"
                        width="1em"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                          fill="none"
                          stroke-linecap="square"
                          stroke-linejoin="round"
                          stroke-width="32"
                          d="M400 256H112"
                        ></path>
                      </svg>
                    </span>
                    <span class="text-gray-500 hover:text-gray-200"
                      >Coupon</span
                    >
                  </a>
                </li>
              </ul>
            </li>
          </ul>
          </ul>
        </div>
    </div>
</aside>