<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/views/partials/adminHeader.jsp" />
<main class="flex">
    <jsp:include page="/views/partials/adminSidebar.jsp" />

    <div class="content bg-gray-900 px-6 w-full">
        <h1 class="my-6 font-bold text-lg text-gray-300">Products</h1>
        
        <!-- below product -->
          <div class="p-4 bg-gray-800 rounded-lg mb-5">
            <div class="flex justify-between pt-3">
              <!-- left -->
              <div class="flex space-x-3 text-white">
                <div>
                  <button
                    class="flex py-2 border justify-center items-center border-gray-300 cursor-pointer h-10 w-20 rounded text-gray-300"
                  >
                    <svg
                      stroke="currentColor"
                      fill="none"
                      stroke-width="2"
                      viewBox="0 0 24 24"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      class="mr-2"
                      height="1em"
                      width="1em"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"
                      ></path>
                      <polyline points="17 8 12 3 7 8"></polyline>
                      <line x1="12" y1="3" x2="12" y2="15"></line>
                    </svg>
                    <span class="text-xs">Export</span>
                  </button>
                </div>
                <div>
                  <button
                    class="flex py-2 border justify-center items-center border-gray-300 cursor-pointer h-10 w-20 rounded text-gray-300"
                  >
                    <svg
                      stroke="currentColor"
                      fill="none"
                      stroke-width="2"
                      viewBox="0 0 24 24"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      class="mr-2"
                      height="1em"
                      width="1em"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"
                      ></path>
                      <polyline points="7 10 12 15 17 10"></polyline>
                      <line x1="12" y1="15" x2="12" y2="3"></line>
                    </svg>
                    <span class="text-xs">Import</span>
                  </button>
                </div>
              </div>

              <!-- right -->
              <div class="flex gap-4">
                <div>
                  <button
                    class="flex items-center justify-center h-12 px-4 py-2 rounded-md text-sm text-white bg-emerald-500 border border-transparent w-full opacity-50 disabled btn-red"
                  >
                    <svg
                      class="mr-2"
                      stroke="currentColor"
                      fill="none"
                      stroke-width="2"
                      viewBox="0 0 24 24"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      height="1em"
                      width="1em"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <polyline points="3 6 5 6 21 6"></polyline>
                      <path
                        d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"
                      ></path>
                      <line x1="10" y1="11" x2="10" y2="17"></line>
                      <line x1="14" y1="11" x2="14" y2="17"></line>
                    </svg>
                    <span>Delete</span>
                  </button>
                </div>
                <div>
                  <a
                    href="#"
                    class="add-btn group block rounded-lg p-2 px-4 bg-white ring-1 ring-slate-900/5 shadow-lg space-y-3 hover:bg-sky-500 hover:ring-sky-500"
                  >
                    <div class="flex items-center space-x-3 h-8">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        height="1em"
                        viewBox="0 0 448 512"
                        class="group-hover:fill-white"
                      >
                        <path
                          d="M64 80c-8.8 0-16 7.2-16 16V416c0 8.8 7.2 16 16 16H384c8.8 0 16-7.2 16-16V96c0-8.8-7.2-16-16-16H64zM0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96zM200 344V280H136c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H248v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"
                        />
                      </svg>
                      <h3
                        class="text-slate-900 group-hover:text-white text-sm font-semibold"
                      >
                        Add Product
                      </h3>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>

          <!-- Search ,category -->
          <div class="p-4 mb-4 bg-gray-800">
            <form class="flex justify-around py-3 gap-6">
              <!-- search -->
              <div class="flex flex-grow w-28">
                <input
                  type="text"
                  class="py-1 px-3 text-sm bg-gray-700 border rounded-md border-gray-600 leading-5 w-full"
                  placeholder="Search Product"
                />
              </div>

              <div class="flex flex-grow">
                <select
                  name=""
                  id=""
                  class="h-12 w-full px-2 py-1 border rounded-md border-gray-600 bg-gray-700 leading-5 text-sm text-gray-300"
                >
                  <option value="" hidden>Category</option>
                  <option value="">test</option>
                </select>
              </div>

              <div class="flex flex-grow">
                <select
                  name=""
                  id=""
                  class="h-12 w-full px-2 py-1 border rounded-md border-gray-600 bg-gray-700 leading-5 text-sm text-gray-300"
                >
                  <option value="" hidden>Price</option>
                  <option value="">test</option>
                </select>
              </div>

              <div class="flex flex-grow gap-2 w-40">
                <div class="w-full mx-1">
                  <button
                    class="flex items-center justify-center cursor-pointer leading-5 font-medium px-4 py-2 rounded-lg text-sm text-white bg-emerald-700 border border-transparent h-12 w-full"
                  >
                    Filter
                  </button>
                </div>
                <div class="w-full mx-1">
                  <button
                    class="flex items-center justify-center h-12 py-2 px-4 w-full cursor-pointer leading-5 font-medium text-sm text-gray-200 border rounded-lg border-gray-200 bg-gray-700 mr-3"
                  >
                    Reset
                  </button>
                </div>
              </div>
            </form>
          </div>

          <!-- Table -->
          <div
            class="w-full border border-gray-700 rounded-lg mb-8 rounded-b-lg"
          >
            <div class="w-full">
              <table class="text-white w-full font-">
                <thead
                  class="text-xs font-semibold tracking-wide text-left text-gray-400 uppercase border-b border-gray-700 bg-gray-800"
                >
                  <tr>
                    <th class="py-2 px-4">
                      <input type="checkbox" />
                    </th>
                    <th class="py-2 px-4 text-center">ID</th>
                    <th class="py-2 px-4 w-64">PRODUCT NAME</th>
                    <th class="py-2 px-4 text-center">COLOR</th>
                    <th class="py-2 px-4 text-center">SIZE</th>
                    <th class="py-2 px-4 w-36">CATEGORY</th>
                    <th class="py-2 px-4 text-center">PRICE</th>
                    <th class="py-2 px-4 text-center">STOCK</th>
                    <th class="py-2 px-4 text-center">STATUS</th>
                    <th class="py-2 px-4 w-28 text-center">ACTIONS</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                  <tr class="border-b border-gray-700 even:bg-slate-800">
                    <td class="py-2 px-4">
                      <input type="checkbox" />
                    </td>
                    <td class="py-2 px-4 text-center">${product.getProductId()}</td>
                    <td class="py-2 px-4">
                      <div class="flex items-center">
                        <div class="w-8 h-8 mr-2">
                          <img
                            class="object-cover rounded-full"
                            src="${product.getImageUrl()}"
                            alt=""
                          />
                        </div>
                        <span class="text-sm font-semibold"
                          >${product.getName()}
                        </span>
                      </div>
                    </td>
                    <td class="py-2 px-4 text-center">
                      <span class="text-sm text-center font-medium"
                        >${product.getColor().getColor()}</span
                      >
                    </td>
                    <td class="py-2 px-4 text-center">
                      <span class="text-sm text-center font-medium"
                        >${product.getSize().getSize()}</span
                      >
                    </td>
                    <td class="py-2 px-4">
                        <div class="flex flex-col">
                            <span class="parent-category-text cursor-pointer">${product.getCategory()[0].getParent().getName()}</span>
                            <div class="children-block flex flex-col hidden">
                                <c:forEach var="category" items="${product.getCategory()}">
                                <span class="text-sm font-medium p-1 ml-1">
                                    ‣ ${category.getName()}
                                </span>
                                </c:forEach>
                            </div>
                        </div>
                      
                    </td>
                    <td class="py-2 px-4">
                      <span class="text-sm text-center block font-bold"
                        >${product.formattedPrice(product.getPrice())}
                      </span>
                    </td>
                    <td class="py-2 px-4">
                      <span class="text-sm text-center block font-bold">${product.getQuantity()}</span>
                    </td>
                    <td class="py-2 px-4">
                        <c:if test="${product.getQuantity() > 0}">
                            <span class="px-2 py-1 text-xs block text-center rounded-full text-emerald-100 bg-emerald-800">
                                Selling
                            </span>
                        </c:if>
                        <c:if test="${product.getQuantity() == 0}">
                            <span class="px-2 py-1 text-xs block text-center rounded-full text-red-100 bg-red-800">
                                Sold Out
                            </span>
                        </c:if>
                    </td>
                    <td class="py-2 px-4 text-center">
                      <div>
                        <input type="hidden" name="_productId" value="${product.getProductId()}">
                        <input type="hidden" name="_name" value="${product.getName()}">
                        <input type="hidden" name="_desc" value="${product.getDescription()}">
                        <input type="hidden" name="_size" value="${product.getSize().getSize()}">
                        <input type="hidden" name="_color" value="${product.getColor().getColor()}">
                        <input type="hidden" name="_imgUrl" value="${product.getImageUrl()}">
                        <input type="hidden" name="_price" value="${product.getPrice()}">
                        <input type="hidden" name="_slug" value="${product.getSlug()}">
                            
                        <c:forEach var="category" items="${product.getCategory()}">
                            <input type="checkbox" name="_categories" class="hidden" checked value="${category.getCategoryId()}">
                        </c:forEach>
                        <input type="hidden" name="_quantity" value="${product.getQuantity()}">
                        <button
                          class="edit-btn p-2 cursor-pointer text-gray-400"
                        >
                          <p class="text-xl">
                            <svg
                              stroke="currentColor"
                              fill="none"
                              stroke-width="2"
                              viewBox="0 0 24 24"
                              stroke-linecap="round"
                              stroke-linejoin="round"
                              height="1em"
                              width="1em"
                              xmlns="http://www.w3.org/2000/svg"
                            >
                              <path
                                d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"
                              ></path>
                              <path
                                d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"
                              ></path>
                            </svg>
                          </p>
                        </button>
                        <button
                          data-id="${product.getProductId()}"
                          class="delete-btn p-2 cursor-pointer text-gray-400"
                        >
                          <p class="text-xl">
                            <svg
                              stroke="currentColor"
                              fill="none"
                              stroke-width="2"
                              viewBox="0 0 24 24"
                              stroke-linecap="round"
                              stroke-linejoin="round"
                              height="1em"
                              width="1em"
                              xmlns="http://www.w3.org/2000/svg"
                            >
                              <polyline points="3 6 5 6 21 6"></polyline>
                              <path
                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"
                              ></path>
                              <line x1="10" y1="11" x2="10" y2="17"></line>
                              <line x1="14" y1="11" x2="14" y2="17"></line>
                            </svg>
                          </p>
                        </button>
                      </div>
                    </td>
                  </tr>
                    </c:forEach>
                </tbody>
              </table>
            </div>

            <!-- left -->
            <div class="px-4 py-3 text-gray-400 bg-gray-800">
              <div class="flex justify-between text-sm text-gray-400">
                <span
                  class="flex items-center font-semibold tracking-wide uppercase"
                  >Showing 1-20 of 310
                </span>

                <!-- paging -->
                <div class="flex mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Product Page Navigation">
                    <ul class="inline-flex items-center">
                      <li>
                        <button
                          class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none p-2 rounded-md text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent opacity-50 cursor-not-allowed"
                          disabled=""
                          type="button"
                          aria-label="Previous"
                        >
                          <svg
                            class="h-3 w-3"
                            aria-hidden="true"
                            fill="currentColor"
                            viewBox="0 0 20 20"
                          >
                            <path
                              d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                              clip-rule="evenodd"
                              fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                      </li>
                      <li>
                        <button
                          class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-white bg-emerald-500 border border-transparent active:bg-emerald-600 hover:bg-emerald-600"
                          type="button"
                        >
                          1
                        </button>
                      </li>
                      <li>
                        <button
                          class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                          type="button"
                        >
                          2
                        </button>
                      </li>
                      <li>
                        <button
                          class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                          type="button"
                        >
                          3
                        </button>
                      </li>
                      <li>
                        <button
                          class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                          type="button"
                        >
                          4
                        </button>
                      </li>
                      <li>
                        <button
                          class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                          type="button"
                        >
                          5
                        </button>
                      </li>
                      <li><span class="px-2 py-1">...</span></li>
                      <li>
                        <button
                          class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                          type="button"
                        >
                          16
                        </button>
                      </li>
                      <li>
                        <button
                          class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none p-2 rounded-md text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                          type="button"
                          aria-label="Next"
                        >
                          <svg
                            class="h-3 w-3"
                            aria-hidden="true"
                            fill="currentColor"
                            viewBox="0 0 20 20"
                          >
                            <path
                              d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                              clip-rule="evenodd"
                              fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>
            </div>
          </div>
    </div>

    <!--!-- Insert Product model -->
    <div
      id="product-insert-model"
      class="flex items-start justify-end z-10 fixed inset-x-0 inset-y-0 bg-gray-900/70 hidden"
    >
      <div class="model bg-gray-800 h-screen" style="width: 85%">
        <div>
          <!-- Header -->
          <div class="flex items-center justify-between p-6">
            <div class="">
              <h4 class="text-gray-300 text-xl">Add Products</h4>
              <p class="text-gray-300 text-sm">
                Update products info, combinations and extras.
              </p>
            </div>

            <div class="flex items-center">
              <button
                class="close-btn focus:outline-none text-red-500 hover:bg-red-100 hover:text-gray-700 transition-colors duration-150 bg-white shadow-md w-10 h-10 rounded-full block text-center"
              >
                <svg
                  stroke="currentColor"
                  fill="none"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="mx-auto"
                  height="1em"
                  width="1em"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <line x1="18" y1="6" x2="6" y2="18"></line>
                  <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg>
              </button>
            </div>
          </div>
        </div>

        <!-- body -->
        <div class="bg-gray-700 h-screen overflow-scroll">
            <form action="<c:url value="/products/create"/>" method="POST" class="px-6 pt-8 pb-44">
            <!-- Product title -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Title/Name</label
              >
              <div class="col-span-4 col-start-3">
                <input
                  type="text"
                  name="name"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product Title/Name"
                  required
                />
              </div>
            </div>

            <!-- Product desc -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Description</label
              >
              <div class="col-span-4 col-start-3">
                <textarea
                  name="description"
                  type="text"
                  class="w-full h-24 p-3 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product Description"
                  required
                ></textarea>
              </div>
            </div>
            
            <!-- Product size -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Product Size</label>
              <div class="col-span-4 col-start-3">
                <select name="size">
                    <c:forEach var="size" items="${sizes}">
                        <option value="${size.getSizeId()}">${size.getSize()}</option>
                    </c:forEach>
                </select>
              </div>
            </div>

            <!-- Product color -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Product Color</label>
              <div class="col-span-4 col-start-3">
                <select name="color">
                    <c:forEach var="color" items="${colors}">
                      <option value="${color.getColorId()}">${color.getColor()}</option>
                    </c:forEach>
                </select>
              </div>
            </div>

            <!-- Product images -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Images</label
              >
              <div class="col-span-4 col-start-3">
                <div class="col-span-4 col-start-3">
                  <input
                    type="text"
                    name="imageUrl"
                    class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                    placeholder="Image URL"
                    required
                  />
                </div>

                <!-- image demo -->
                <div class="flex flex-row mt-4 space-x-2">
                  <!-- items -->
                  <div class="">
                    <div draggable="true">
                      <div class="relative">
                        <img
                          class="img-demo w-24 max-h-24 p-2 m-2 border border-md border-gray-600"
                          src="https://mldrbgfat3wx.i.optimole.com/SQPHnU0-fDNzwSu7/w:300/h:300/q:auto/rt:fill/g:ce/https://dici.themes.zone/main/wp-content/uploads/sites/8/2018/04/DC_Products_8.jpg"
                          alt=""
                        />
                        <p
                          class="absolute w-full py-1 text-xs text-white text-center inset-x-0 bottom-0 rounded-full bg-blue-500"
                        >
                          Default image
                        </p>
                        <button
                          type="button"
                          class="absolute -top-2 right-0 text-red-500 focus:outline-none"
                        >
                          <svg
                            class="close-img"
                            stroke="currentColor"
                            fill="none"
                            stroke-width="2"
                            viewBox="0 0 24 24"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            height="1em"
                            width="1em"
                            xmlns="http://www.w3.org/2000/svg"
                          >
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="15" y1="9" x2="9" y2="15"></line>
                            <line x1="9" y1="9" x2="15" y2="15"></line>
                          </svg>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Product category -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Category</label
              >
              <div class="col-span-4 col-start-3">
                <input
                  type="text"
                  class="category-input w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product Categories"
                />
                <div class="root-category-handle flex items-center mt-3">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    height="1em"
                    viewBox="0 0 576 512"
                    class=""
                    fill="#6366f1"
                  >
                    <path
                      d="M64 32C64 14.3 49.7 0 32 0S0 14.3 0 32v96V384c0 35.3 28.7 64 64 64H256V384H64V160H256V96H64V32zM288 192c0 17.7 14.3 32 32 32H544c17.7 0 32-14.3 32-32V64c0-17.7-14.3-32-32-32H445.3c-8.5 0-16.6-3.4-22.6-9.4L409.4 9.4c-6-6-14.1-9.4-22.6-9.4H320c-17.7 0-32 14.3-32 32V192zm0 288c0 17.7 14.3 32 32 32H544c17.7 0 32-14.3 32-32V352c0-17.7-14.3-32-32-32H445.3c-8.5 0-16.6-3.4-22.6-9.4l-13.3-13.3c-6-6-14.1-9.4-22.6-9.4H320c-17.7 0-32 14.3-32 32V480z"
                    />
                  </svg>
                  <h3
                    class="py-1 cursor-pointer select-none font-bold ml-2 text-indigo-400"
                  >
                    Categories
                  </h3>
                </div>
                <ul class="category-list ml-4 hidden">
                <c:forEach var="category" items="${categories}">
                <c:if test="${category.getParentId() == null}">
                    <li class="font-semibold mb-1">
                    <input
                      type="checkbox"
                      name="categories"
                      value=""
                      class="hidden"
                    />
                    <div
                      class="parent-category-handle select-none cursor-pointer flex items-center"
                    >
                      <svg
                        class="parent-category w-5"
                        xmlns="http://www.w3.org/2000/svg"
                        height="1em"
                        viewBox="0 0 256 512"
                        fill= #8b5cf6
                      >
                        <path
                          d="M246.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-9.2-9.2-22.9-11.9-34.9-6.9s-19.8 16.6-19.8 29.6l0 256c0 12.9 7.8 24.6 19.8 29.6s25.7 2.2 34.9-6.9l128-128z"
                        />
                      </svg>
                      <span class="ml-2 text-violet-400">${category.getName()}</span>
                    </div>
                    <ul class="child-category-handle ml-4 hidden">
                        <c:forEach var="child" items="${category.getChildren()}">
                        <li
                        class="child-item flex items-center pb-1 mt-2 ml-5 cursor-pointer text-sm font-semibold text-violet-300 cursor-pointer select-none selected">
                        <svg
                          class="w-8"
                          xmlns="http://www.w3.org/2000/svg"
                          height="1em"
                          viewBox="0 0 576 512"
                          fill="#8b5cf6"
                        >
                          <path
                            d="M384 480h48c11.4 0 21.9-6 27.6-15.9l112-192c5.8-9.9 5.8-22.1 .1-32.1S555.5 224 544 224H144c-11.4 0-21.9 6-27.6 15.9L48 357.1V96c0-8.8 7.2-16 16-16H181.5c4.2 0 8.3 1.7 11.3 4.7l26.5 26.5c21 21 49.5 32.8 79.2 32.8H416c8.8 0 16 7.2 16 16v32h48V160c0-35.3-28.7-64-64-64H298.5c-17 0-33.3-6.7-45.3-18.7L226.7 50.7c-12-12-28.3-18.7-45.3-18.7H64C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H87.7 384z"
                          />
                        </svg>
                        <span class="focus:bg-violet-700">${child.getName()}</span>
                        <input type="checkbox" name="categories" value="${child.getCategoryId()}" class="">
                      </li>
                        </c:forEach>
                    </ul>
                  </li>
                </c:if>
                </c:forEach>
                  
                </ul>
              </div>
            </div>

            <!-- Product Price -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Product Price</label>
              <div class="flex flex-row col-span-4 col-start-3">
                <span
                  class="inline-flex items-center px-3 rounded rounded-r-none border-r-0 text-sm focus:border-emerald-300 bg-gray-700 text-gray-300 border border-gray-600"
                  >$</span
                >
                <input
                  type="number"
                  name="price"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-tr-md rounded-br-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Original Price"
                  required
                />
              </div>
            </div>

            <!-- Sale Price -->
<!--            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Product Price</label>
              <div class="flex flex-row col-span-4 col-start-3">
                <span
                  class="inline-flex items-center px-3 rounded rounded-r-none border-r-0 text-sm focus:border-emerald-300 bg-gray-700 text-gray-300 border border-gray-600"
                  >$</span
                >
                <input
                  type="number"
                  name="salePrice"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-tr-md rounded-br-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Sale Price"
                />
              </div>
            </div>-->
            
            <!--Quantity-->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Selling quantity</label>
              <div class="flex flex-row col-span-4 col-start-3">
                <span
                  class="inline-flex items-center px-3 rounded rounded-r-none border-r-0 text-sm focus:border-emerald-300 bg-gray-700 text-gray-300 border border-gray-600"
                  >sl</span
                >
                <input
                  type="number"
                  name="quantity"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-tr-md rounded-br-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Quantity"
                />
              </div>
            </div>

            <!-- Slug -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Slug</label>
              <div class="col-span-4 col-start-3">
                <input
                  type="text"
                  name="slug"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product slug"
                  value=""
                />
              </div>
            </div>
            <button
              type="submit"
              href="#"
              class="group block float-right rounded-lg p-2 px-4 bg-white ring-1 ring-slate-900/5 shadow-lg space-y-3 hover:bg-sky-500 hover:ring-sky-500"
            >
              <div class="flex items-center space-x-3 h-8">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  height="1em"
                  viewBox="0 0 448 512"
                  class="group-hover:fill-white"
                >
                  <path
                    d="M64 80c-8.8 0-16 7.2-16 16V416c0 8.8 7.2 16 16 16H384c8.8 0 16-7.2 16-16V96c0-8.8-7.2-16-16-16H64zM0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96zM200 344V280H136c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H248v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"
                  />
                </svg>
                <h3
                  class="text-slate-900 group-hover:text-white text-sm font-semibold"
                >
                  Add Product
                </h3>
              </div>
            </button>
          </form>
        </div>
      </div>
    </div>
            
    <!--Update Product model-->   
    <div
      id="product-edit-model"
      class="flex items-start justify-end z-10 fixed inset-x-0 inset-y-0 bg-gray-900/70 hidden"
    >
      <div class="model bg-gray-800 h-screen" style="width: 85%">
        <div>
          <!-- Header -->
          <div class="flex items-center justify-between p-6">
            <div class="">
              <h4 class="text-gray-300 text-xl">Update Product</h4>
              <p class="text-gray-300 text-sm">
                Update products info, combinations and extras.
              </p>
            </div>

            <div class="flex items-center">
              <button
                class="close-btn focus:outline-none text-red-500 hover:bg-red-100 hover:text-gray-700 transition-colors duration-150 bg-white shadow-md w-10 h-10 rounded-full block text-center"
              >
                <svg
                  stroke="currentColor"
                  fill="none"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="mx-auto"
                  height="1em"
                  width="1em"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <line x1="18" y1="6" x2="6" y2="18"></line>
                  <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg>
              </button>
            </div>
          </div>
        </div>

        <!-- body -->
        <div class="bg-gray-700 h-screen overflow-scroll">
            <form action="<c:url value="/products/update"/>" method="POST" class="px-6 pt-8 pb-44">
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Identification</label
              >
              <div class="col-span-4 col-start-3">
                <input
                  type="text"
                  name="form-id"
                  class="w-20 h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="ID"
                  value=""
                  required
                  readonly
                />
              </div>
            </div>
                
            <!-- Product title -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Title/Name</label
              >
              <div class="col-span-4 col-start-3">
                <input
                  type="text"
                  name="form-name"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product Title/Name"
                  value=""
                  required
                />
              </div>
            </div>

            <!-- Product desc -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Update Product</label
              >
              <div class="col-span-4 col-start-3">
                <textarea
                  name="form-desc"
                  type="text"
                  class="w-full h-24 p-3 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product Description"
                  required
                ></textarea>
              </div>
            </div>
            
            <!-- Product size -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Product Size</label>
              <div class="col-span-4 col-start-3">
                <select name="size">
                    <c:forEach var="size" items="${sizes}">
                        <option value="${size.getSizeId()}">${size.getSize()}</option>
                    </c:forEach>
                </select>
              </div>
            </div>

            <!-- Product color -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Product Color</label>
              <div class="col-span-4 col-start-3">
                <select name="color">
                    <c:forEach var="color" items="${colors}">
                      <option value="${color.getColorId()}">${color.getColor()}</option>
                    </c:forEach>
                </select>
              </div>
            </div>

            <!-- Product images -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Images</label
              >
              <div class="col-span-4 col-start-3">
                <div class="col-span-4 col-start-3">
                  <input
                    type="text"
                    name="form-imgUrl"
                    class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                    placeholder="Image URL"
                    required
                  />
                </div>

                <!-- image demo -->
                <div class="flex flex-row mt-4 space-x-2">
                  <!-- items -->
                  <div class="">
                    <div draggable="true">
                      <div class="relative">
                        <img
                          class="_img-demo w-24 max-h-24 p-2 m-2 border border-md border-gray-600"
                          src=""
                          alt=""
                        />
                        <p
                          class="absolute w-full py-1 text-xs text-white text-center inset-x-0 bottom-0 rounded-full bg-blue-500"
                        >
                          Default image
                        </p>
                        <button
                          type="button"
                          class="absolute -top-2 right-0 text-red-500 focus:outline-none"
                        >
                          <svg
                            class="close-img"
                            stroke="currentColor"
                            fill="none"
                            stroke-width="2"
                            viewBox="0 0 24 24"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            height="1em"
                            width="1em"
                            xmlns="http://www.w3.org/2000/svg"
                          >
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="15" y1="9" x2="9" y2="15"></line>
                            <line x1="9" y1="9" x2="15" y2="15"></line>
                          </svg>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Product category -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Category</label
              >
              <div class="col-span-4 col-start-3">
                <input
                  type="text"
                  class="category-input w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product Categories"
                />
                <div class="root-category-handle flex items-center mt-3">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    height="1em"
                    viewBox="0 0 576 512"
                    class=""
                    fill="#6366f1"
                  >
                    <path
                      d="M64 32C64 14.3 49.7 0 32 0S0 14.3 0 32v96V384c0 35.3 28.7 64 64 64H256V384H64V160H256V96H64V32zM288 192c0 17.7 14.3 32 32 32H544c17.7 0 32-14.3 32-32V64c0-17.7-14.3-32-32-32H445.3c-8.5 0-16.6-3.4-22.6-9.4L409.4 9.4c-6-6-14.1-9.4-22.6-9.4H320c-17.7 0-32 14.3-32 32V192zm0 288c0 17.7 14.3 32 32 32H544c17.7 0 32-14.3 32-32V352c0-17.7-14.3-32-32-32H445.3c-8.5 0-16.6-3.4-22.6-9.4l-13.3-13.3c-6-6-14.1-9.4-22.6-9.4H320c-17.7 0-32 14.3-32 32V480z"
                    />
                  </svg>
                  <h3
                    class="py-1 cursor-pointer select-none font-bold ml-2 text-indigo-400"
                  >
                    Categories
                  </h3>
                </div>
                <ul class="category-list ml-4 hidden">
                <c:forEach var="category" items="${categories}">
                <c:if test="${category.getParentId() == null}">
                    <li class="font-semibold mb-1">
                    <div
                      class="parent-category-handle select-none cursor-pointer flex items-center"
                    >
                      <svg
                        class="parent-category w-5"
                        xmlns="http://www.w3.org/2000/svg"
                        height="1em"
                        viewBox="0 0 256 512"
                        fill= #8b5cf6
                      >
                        <path
                          d="M246.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-9.2-9.2-22.9-11.9-34.9-6.9s-19.8 16.6-19.8 29.6l0 256c0 12.9 7.8 24.6 19.8 29.6s25.7 2.2 34.9-6.9l128-128z"
                        />
                      </svg>
                      <span class="ml-2 text-violet-400">${category.getName()}</span>
                    </div>
                    <ul class="child-category-handle ml-4 hidden">
                        <c:forEach var="child" items="${category.getChildren()}">
                        <li
                        class="child-item flex items-center pb-1 mt-2 ml-5 cursor-pointer text-sm font-semibold text-violet-300 cursor-pointer select-none selected">
                        <svg
                          class="w-8"
                          xmlns="http://www.w3.org/2000/svg"
                          height="1em"
                          viewBox="0 0 576 512"
                          fill="#8b5cf6"
                        >
                          <path
                            d="M384 480h48c11.4 0 21.9-6 27.6-15.9l112-192c5.8-9.9 5.8-22.1 .1-32.1S555.5 224 544 224H144c-11.4 0-21.9 6-27.6 15.9L48 357.1V96c0-8.8 7.2-16 16-16H181.5c4.2 0 8.3 1.7 11.3 4.7l26.5 26.5c21 21 49.5 32.8 79.2 32.8H416c8.8 0 16 7.2 16 16v32h48V160c0-35.3-28.7-64-64-64H298.5c-17 0-33.3-6.7-45.3-18.7L226.7 50.7c-12-12-28.3-18.7-45.3-18.7H64C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H87.7 384z"
                          />
                        </svg>
                        <span class="focus:bg-violet-700">${child.getName()}</span>
                        <input type="checkbox" name="form-categories" value="${child.getCategoryId()}" class="">
                      </li>
                        </c:forEach>
                    </ul>
                  </li>
                </c:if>
                </c:forEach>
                  
                </ul>
              </div>
            </div>

            <!-- Product Price -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Product Price</label>
              <div class="flex flex-row col-span-4 col-start-3">
                <span
                  class="inline-flex items-center px-3 rounded rounded-r-none border-r-0 text-sm focus:border-emerald-300 bg-gray-700 text-gray-300 border border-gray-600"
                  >$</span
                >
                <input
                  type="number"
                  name="form-price"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-tr-md rounded-br-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Original Price"
                  required
                />
              </div>
            </div>

<!--             Sale Price 
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Product Price</label>
              <div class="flex flex-row col-span-4 col-start-3">
                <span
                  class="inline-flex items-center px-3 rounded rounded-r-none border-r-0 text-sm focus:border-emerald-300 bg-gray-700 text-gray-300 border border-gray-600"
                  >$</span
                >
                <input
                  type="number"
                  name="salePrice"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-tr-md rounded-br-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Sale Price"
                />
              </div>
            </div>-->
            
            <!--Quantity-->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Selling quantity</label>
              <div class="flex flex-row col-span-4 col-start-3">
                <span
                  class="inline-flex items-center px-3 rounded rounded-r-none border-r-0 text-sm focus:border-emerald-300 bg-gray-700 text-gray-300 border border-gray-600"
                  >sl</span
                >
                <input
                  type="number"
                  name="form-quantity"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-tr-md rounded-br-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Quantity"
                />
              </div>
            </div>

            <!-- Slug -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Slug</label>
              <div class="col-span-4 col-start-3">
                <input
                  type="text"
                  name="form-slug"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product slug"
                  value=""
                />
              </div>
            </div>
            <button
              type="submit"
              href="#"
              class="group block float-right rounded-lg p-2 px-4 bg-white ring-1 ring-slate-900/5 shadow-lg space-y-3 hover:bg-sky-500 hover:ring-sky-500"
            >
              <div class="flex items-center space-x-3 h-8">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  height="1em"
                  viewBox="0 0 448 512"
                  class="group-hover:fill-white"
                >
                  <path
                    d="M64 80c-8.8 0-16 7.2-16 16V416c0 8.8 7.2 16 16 16H384c8.8 0 16-7.2 16-16V96c0-8.8-7.2-16-16-16H64zM0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96zM200 344V280H136c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H248v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"
                  />
                </svg>
                <h3
                  class="text-slate-900 group-hover:text-white text-sm font-semibold"
                >
                  Update Product
                </h3>
              </div>
            </button>
          </form>
        </div>
      </div>
    </div>
    
            
    <!-- Delete Product model -->
    <div
      id="product-delete-model"
      class="flex items-center justify-center z-10 fixed inset-x-0 inset-y-0 bg-gray-900/70 hidden"
    >
      <div class="model bg-slate-100 w-2/6 rounded-lg">
        <div class="flex flex-col items-center justify-center p-10">
          <div>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              height="1em"
              viewBox="0 0 512 512"
              fill="#f43f5e"
              class="text-3xl"
            >
              <path
                d="M256 32c14.2 0 27.3 7.5 34.5 19.8l216 368c7.3 12.4 7.3 27.7 .2 40.1S486.3 480 472 480H40c-14.3 0-27.6-7.7-34.7-20.1s-7-27.8 .2-40.1l216-368C228.7 39.5 241.8 32 256 32zm0 128c-13.3 0-24 10.7-24 24V296c0 13.3 10.7 24 24 24s24-10.7 24-24V184c0-13.3-10.7-24-24-24zm32 224a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z"
              />
            </svg>
          </div>

          <div>
            <p class="font-bold text-xl py-4">Are you sure ?</p>
          </div>

          <div>
            <p class="font-medium py-4 text-slate-500 text-center mb-2">
              This action can not be undone. All values associated with this
              field will be lost
            </p>
          </div>

          <div class="w-full text-center">
            <form action="<c:url value="/products/delete" />" name="delete-form" method="POST">
                <input type="hidden" name="delete-form-productId" value="">
                <button
                type="submit"
                class="confirm-delete-btn bg-red-500 text-white w-full py-2 rounded-md mb-4 font-semibold"
                >
                Delete product
              </button>
            </form>
          </div>

          <div class="w-full text-center">
            <button
              class="cancel-btn w-full py-2 rounded-md mb-4 font-semibold border-solid border-2 border-gray-300"
            >
              Cancel
            </button>
          </div>
        </div>
      </div>
    </div>
</main>
<jsp:include page="/views/partials/adminFooter.jsp" />